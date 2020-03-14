
<!doctype html>
<html lang="zxx">
    <%@ include file="head.jsp" %>
    <style type="text/css">
body {
	background-color: rgb(241,250,248)
}

.dg-question-label{ /* Question label */
	font-weight:bold;
	font-size: 30px;
	margin: 10px;
}

img{
	border:0px;
}
#error {
	font-style:italic;
	color:red;
}
.dg-answer-button-container input{
	background-color: rgb(35, 184, 62);
	color: white;
	height: 35px;
	width: 100px;
	border: 0px;
	border-radius: 5px;
	margin: 10px;
}

.dg-answer-button-container input:hover{
	background-color: grey;
	color: black;
	}
</style>
<body>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg" style="height: 100px; border-radius:0px;">
         
                    <div style="padding-top: 0px;height:100px;"class="breadcrumb_iner text-center">
                        <div style="padding-top: 0px;" class="breadcrumb_iner_item">
                            <h2 style="font-size:30px;	margin-top:0px;">Assessment Preview</h2>
                        </div>
                    </div>
              
    </section>
    <!-- breadcrumb start-->
     
    <div style="background-color: rgb(241,250,248); width: 100%; height:100%;  padding: 30px;">
          
            
				<center><div id="questions"></div>
				<div id="error"></div>
				<div id="result"></div>
				</center>
	</div>
<%@ include file="jsScriptUser.jsp" %>
<script>

$(document).ready(function(){
	transferData();
	quizMaker.start();
});


function showWrongAnswer(){
    document.id('error').set('html', 'Wrong answer, Please try again');
}

function showScore() {
	var score = quizMaker.getScore();

	var el = new Element('h3');
	el.set('html', 'Thank you!');
    document.id('result').adopt(el);

	el = new Element('h4');
	el.set('html', 'Score: ' + score.numCorrectAnswers + ' of ' + score.numQuestions);
    document.id('result').adopt(el);

	if(score.incorrectAnswers.length > 0) {
		el = new Element('h4');
		el.set('html', 'Incorrect answers:');
        document.id('result').adopt(el);

		for(var i=0;i<score.incorrectAnswers.length;i++) {
			var incorrectAnswer = score.incorrectAnswers[i];
			el = new Element('div');
			el.set('html', '<b>' +  incorrectAnswer.questionNumber + ': ' + incorrectAnswer.label + '</b>');
			document.id('result').adopt(el);

			el = new Element('div');
			el.set('html', 'Correct answer : ' + incorrectAnswer.correctAnswer);
            document.id('result').adopt(el);
			el = new Element('div');
			el.set('html', 'Your answer : ' + incorrectAnswer.userAnswer);
            document.id('result').adopt(el);

		}
	}

}
//dito mo sa data lagay yung JSON galing sa DB :) 
var data = [

		{
			question: "What is the unit of resistance?",
			a: "Ohm",
			b: "Ampere",
			c: "Volt",
			d: "Watt",
			ans: "A",
		},
		{
			question: "Anong hotdog ka",
			a: "Bibp",
			b: "Tender Juicy",
			c: "Hehe",
			d: "Idol",
			ans: "D",
		}
	
]

var newOptions = [];
var newAnswer = [];
var questions = [];
function transferData(){
	var l = data.length;
	
	for (var i=0;i<l;i++) {
			newOptions.push(data[i].a);
			newOptions.push(data[i].b);
			newOptions.push(data[i].c);
			newOptions.push(data[i].d);
		  	console.log(newOptions);
		  	switch(data[i].ans){
		  	case "A": newAnswer.push(data[i].a);
		  	break;
		  	case "B": newAnswer.push(data[i].b);
		  	break;
		  	case "C": newAnswer.push(data[i].c);
		  	break;
		  	case "D": newAnswer.push(data[i].d);
		  	break;
		  	}
		  	questions.push("foo");
		  	questions[i] = {label: data[i].question, options: newOptions, answer: newAnswer, forceAnswer: true};

		  	newOptions =[];
		  	newAnswer = [];
		}
}

function showAnswerAlert() {
	document.id('error').set('html', 'You have to answer before you continue to the next question');
}
function clearErrorBox() {
    document.id('error').set('html','');
}
var quizMaker = new DG.QuizMaker({
	questions : questions,
	el : 'questions',
    forceCorrectAnswer:false,
	listeners : {
		'finish' : showScore,
		'missinganswer' : showAnswerAlert,
		'sendanswer' : clearErrorBox,
        'wrongAnswer' : showWrongAnswer
	}
});
</script>





</body>

</html>