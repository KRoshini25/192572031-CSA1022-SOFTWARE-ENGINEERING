# Q2 – Online Banking System UML Class Diagram

**Aim:** Design a UML Class Diagram showing the major banking classes, attributes, methods and relationships.

## Main classes
- Customer: customerId, name, email; `login()`, `viewBalance()`, `downloadStatement()`
- Account: accountNumber, balance; `deposit()`, `withdraw()`, `transferMoney()`
- SavingsAccount: interestRate; `calculateInterest()`
- CurrentAccount: overdraftLimit; `checkOverdraft()`
- Transaction: transactionId, amount, date, type; `recordTransaction()`
- Beneficiary: beneficiaryId, name, accountNumber; `saveBeneficiary()`
- Notification: notificationId, channel; `sendSMS()`, `sendEmail()`

The Account class validates the available balance before completing a transfer. An account is associated with its transaction records. SavingsAccount and CurrentAccount inherit from Account.
