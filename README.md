# ninjastudies

Intro - 
This is a grammar tutor MVP. 
There is an API which gives us a static conversation between a human and a chat bot.
We need analyze the human messages and provides suggestions and corrections 

*Unique feature - Speech to text is supported.*

To use punctuations you need to call out pronounce punctuations for eg. to add "," pronounce "comma"

##Usability - Click on the mic icon and speak after done speaking the text will be shown in the text box which can be modified or     sent directly & also 

If the human gives correct answer (as referenced from the static conversation) than bot will continue with next dialog without giving 
any suggestions or corrections.
But if the human answer is not at par with the static conversation provided by API we need to suggest what was wrong with the answer to the human in a chat format.

Cases covered for checking and suggesting:
If human has -
1. missed a word, suggest the missing word. (Extra- Multiple missing words case covered).
2. given a wrong word, suggest the correct word. (Extra- Multiple wrong words case covered).
3. given totally incorrect answer, show " I didn't understood"
4. Provide with the correct sentence after two attempts.
5. Record human messages after static conversation is finished.

