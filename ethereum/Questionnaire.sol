contract Questionnaire {
    string question;
    ///array of strings with variable size
    bytes[] answers;
    ///lets go with only this to keep it as simple as possible in the first place
    uint max_votes;
    ///general vote count
    uint gvote;
    ///to count votes on answers
    mapping(string => uint) votes;

    ///constructor function
    function Questionnaire(string question, bytes[] answers, uint max_votes) public {
        question = question;
        answers = answers;
        max_votes = max_votes;
    }

    ///return all answers at once
    function getDeployedCampaigns() public view returns (bytes[]) {
        return answers;
    }

    function vote(string voting) public {
        votes[voting] += 1;
        gvote += 1;
        
        if(gvote == max_votes) {
            ///when max_votes is reached payout and self destruct
        }


    }

///implement a variable to store voter addresses and distribute contract funds when max_votes is reached

}