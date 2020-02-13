pragma solidity ^0.5.10

contract Questionnaire {
    string question;
    //array of strings with variable size
    bytes[] answers;
    //lets go with only this to keep it as simple as possible in the first place
    uint max_votes;
    //general vote count
    uint gvote;
    //to count votes on answers
    mapping(string => uint) votes;
    //variable for rewards
    uint reward;
    
    //THIS MUST BE REWORKED, ITERATION IS A BAD THING IN THIS WORLD :D
    //list of voting addresses
    address[] voters;
    mapping(address => bool) voted;

    //constructor function
    function Questionnaire(string question, bytes[] answers, uint max_votes) public {
        question = question;
        answers = answers;
        max_votes = max_votes;
    }

    //return all answers at once
    function getAnswers() public view returns (bytes[]) {
        return answers;
    }

    //spliting the funds and
    //sending transaction to list of voters
    //call returns a boolean value indicating success or failure
    function sendFunds() public returns(bool success) {
        reward = this.balance - 1000000000000000;
        reward = reward / voters.length;

        for (i=0; i<voters.length; i++) {
            voters[i].transfer(reward); 
        }
        return true;
    }

    function vote(string voting) public {
        //not voted before and increment variables
        require(!voted[msg.sender]);
        votes[voting] += 1;
        gvote += 1;
        //record vote and address
        voters.push(msg.sender);
        voted[msg.sender] = true;

        //when max_votes is reached
        if(gvote == max_votes) {
            //when contract balance > 0.01 ETH
            if(this.balance >= 10000000000000000) {
                sendFunds()

                selfdestruct()
            }
        //else just selfdestruct 
        }


    }

}