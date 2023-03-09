//SPDX-License-Identifier:MIT
pragma solidity>=0.8.4;
contract Election{
    struct Voter{
        uint256 voterid;
        string votername;
        uint voterage;
        string citizenship;
        string constituency;
        bool hasvoted;

        }
        mapping(uint256=>Voter) public Voterdatabase;
        uint count=1;
        modifier theregisteredvoters(uint voterId)
        {
            require(Voterdatabase[voterId].voterid!=0,"You are not a registered voter");
            _;
        }
        function registerdvoters(
            uint256 _voterid,
            string memory _votername,
            uint _voterage,
            string memory _citizenship,
            string memory _constituency
        )
        public{
        require(_voterage>=18,"You are minor and can't vote");
        Voterdatabase[count].voterid=_voterid;
        Voterdatabase[count].votername=_votername;
        Voterdatabase[count].voterage=_voterage;
        Voterdatabase[count].citizenship=_citizenship;
        Voterdatabase[count].constituency=_constituency;
        count++;
        }
        

        function isvoted(uint256 voterId) public theregisteredvoters(voterId){
            require(!Voterdatabase[voterId].hasvoted,"you have voted before");

            Voterdatabase[voterId].hasvoted=true;
        }
}
