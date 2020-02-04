1. Ask Question
    invoke contract factory
        Parameter: Question, Answers, max votes, lifetime
        Sends X ETH as reward with deployment transaction

    Serverside catch Transaction hash and store in array

2. Display Questions
    iterates through questions array and fetches data from chain to display questions
    * minimum reward
    * Question
    * answers
    * vote results

3. Answer questions
    checks if max vote is reached
    sends transaction to answer question
        Parameter: index of answer  
    Contract stores answerers address
    Icrements vote counter 


Contract Questionnaire 
    Variables:
        string question;
        bytes[] answers;
            ///array of strings with variable size
        uint max_votes;
            ///lets go with only this to keep it as simple as possible in the first place
        mappping(string => uint) votes;
            ///to count votes on answers
        