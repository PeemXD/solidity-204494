// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;



contract Borrow {
    struct collateral {
        uint amount;
        uint ratio;
        bool cannotborrow;
    }

    mapping (address => collateral) _collateralAsset;
    mapping (address => uint) _borrow;


    function borrow(uint collateralOver) public payable{
        require(_collateralAsset[msg.sender].cannotborrow == false, "you must be return asset that borrow first");
        require(collateralOver >= 150 && collateralOver <= 300, "require collateral between 150 and 300%.");
        require(msg.value >= 100000000000000000, "Ether must greater than equal 0.1");

        _collateralAsset[msg.sender] = collateral(msg.value, 100*(10**2)/collateralOver, true);
        uint borrowAmount = (_collateralAsset[msg.sender].amount * _collateralAsset[msg.sender].ratio) / (10**2);
        _borrow[msg.sender] = borrowAmount;
        payable(msg.sender).transfer(_borrow[msg.sender]);
    }

    function closePosition() external payable{
        require(_borrow[msg.sender] == msg.value, "Repayment amount must be equal your loan");

        payable(msg.sender).transfer(_collateralAsset[msg.sender].amount);
        _collateralAsset[msg.sender].amount = 0;
        _collateralAsset[msg.sender].ratio = 0;
        _collateralAsset[msg.sender].cannotborrow = false;
       
    }
}

// contract Pawn {
//     address public borrower;
//     uint public collateralAmount;
//     uint public loanAmount;
//     uint public remainingRepayment;
//     bool public loanRepaid;

//     event LoanReceived(uint amount);
//     event LoanRepaid(uint amount);

//     constructor() {
//         borrower = msg.sender;
//         collateralAmount = 4 ether;
//         loanAmount = 200;
//         remainingRepayment = loanAmount;
//         loanRepaid = false;
//     }

//     modifier onlyBorrower() {
//         require(msg.sender == borrower, "Only the borrower can call this function");
//         _;
//     }

//     modifier loanNotRepaid() {
//         require(!loanRepaid, "Loan has already been repaid");
//         _;
//     }

//     receive() external payable {
//         emit LoanReceived(msg.value);
//     }

//     function repayLoan(uint amount) external payable onlyBorrower loanNotRepaid {
//         require(amount > 0, "Repayment amount must be greater than 0");
//         require(amount <= remainingRepayment, "Amount exceeds remaining repayment");
        
//         remainingRepayment -= amount;

//         if (remainingRepayment == 0) {
//             loanRepaid = true;
//             payable(borrower).transfer(collateralAmount);
//         }

//         emit LoanRepaid(amount);
//     }

//     function checkStatus() external view returns (address, uint, uint, uint, bool) {
//         return (borrower, collateralAmount, loanAmount, remainingRepayment, loanRepaid);
//     }
// }