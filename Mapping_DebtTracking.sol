//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.8.17;

contract DebtTracking {
    mapping(address => mapping(address => uint)) owing;

    function addDebt(
        address toBePaidAddress,
        address payingAddress,
        uint256 amount
    ) public {
        owing[toBePaidAddress][payingAddress] += amount;
        //+ is important here, because, if the same payingAddress takes a loan again from toBePaidAddress, 
        //then this new loan should be added to the existing loan.
        //if + isn't added, then the old load will get deleted and the new loan will get added.
    }

    //updates the mapping accordingly to reduce the amout of debt owed by payingAddress
    //to toBePaidAddress by the amoundPayed.
    //if the amoundPayed is greater than the amount that was owed then update the mapping accordingly.
    //if the amoundPayed is greater than the amount that was owed, then the user now owes the change.

    function payDebt(
        address toBePaidAddress,
        address payingAddress,
        uint256 amount
    ) public {

        //this is subtracting when the amount paid is greater than the owed amount.
        //owing[toBePaidAddress][payingAddress] -= amount;

        uint256 amountOwed = owing[toBePaidAddress][payingAddress];

        if (amount > amountOwed) {

            uint256 change = amount - amountOwed;

            owing[toBePaidAddress][payingAddress] = 0;
            //0 because the debt has been paid, so we are updating this mapping.

            owing[payingAddress][toBePaidAddress] += change;
            //Here are calculating the change that the original owner now owes the debter.

        } else owing[toBePaidAddress][payingAddress] -= amount;
    }

    function getDebt(address toBePaidAddress, address payingAddress)
        public
        view
        returns (uint256)
    {
        return owing[toBePaidAddress][payingAddress];
    }
}

//0xa08F73261A7A1f533A50CB1DcfFEd9594b623FF5,0x86e382f34dEe09944C3bfe172095E95D5bb76e62,3
