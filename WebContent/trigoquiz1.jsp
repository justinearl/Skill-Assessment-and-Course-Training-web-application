<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page language="java"
import="java.security.MessageDigest"%> <%@ page session="true" %> <%
response.setHeader("Pragma", "No-cache"); response.setHeader("Cache-Control",
"no-cache, no-store, must-revalidate"); response.setDateHeader("Expires", -1);
%> <% if(session.getAttribute("sessionID") == null){
response.sendRedirect("index.jsp"); }else { 
	String att = request.getParameter("attempt");
	
	if(att == null){
		response.sendRedirect("assessment1.jsp");
	}else{
		int checkAttempt = Integer.parseInt(att);
	if(!(checkAttempt > 0)){
		response.sendRedirect("assessment1.jsp");
	}
	}
%>
<html>
    <head>
        <title>Trigonometry</title>
        <link href="//fonts.googleapis.com/css?family=Roboto+Mono:400,400italic,500,500italic,700,700italic|Roboto:400,400italic,500,500italic,700,700italic" rel="stylesheet" type="text/css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js"></script>
        <style>
            body{
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
  font-family:  "Barlow Semi Condensed", sans-serif;;
  font-weight: 400;
}

/* Stage Structure Styles */

#stage {
  width: 100%;
  height: 100%;
  border: 10px #3B13B1;
  border-style: solid;
  background-color:white;
  position: fixed;
  top:0;
}

#container {
  padding: 30px;
}

#gameContainer h1 {
  text-align: center;
  font-size: 50px;
  padding-top: 250px;
  padding-bottom: 30px;
  color: #3B13B1;
}

#gameHeader {
  display: none;
  padding: 0 20px;
}

/* Core Game Element Styles */
#gameChoices {
  display: none;
}

.container {
  padding:20px;
  margin-top: 100px;
}

#gameChoices button {
  /* box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26); */
  line-height: 32px;
  border-radius: 10px;
  font-size: 26px;
  width: 100%;
  outline:none;
  border:none;
  background-color: #22c0ff;
  height: 18%;
  display: block;
  color: #fff;
  cursor: pointer;
  text-align: center;
  padding: 12px;
  font-family:  "Barlow Semi Condensed", sans-serif;;
  font-weight: 400;
}

#gameChoices button:hover {
  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.26), 0 4px 15px 0 rgba(0, 0, 0, 0.26);
  background-color: #107D7A;
}

.left {
  float: left;
  display: block;
}

.questions {
  width: 68%;
  /* background-color: #000; */
  float:left;
  display: block;
  /* margin-right: 2%; */
  /* box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26); */
  padding-top: 60px;
  
}

.questions span {
  color:black;
  font-size: 26px;

}

.timer {
  /* width: 15%; */
  /* background-color: #f4b400; */
  padding-top: 60px;
  padding-left: 60px;
  float:left;
  display: block;
  /* margin-right: 2%; */
  /* box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26); */
  font-size: 26px;
  color: red;
}

.score {
  /* width: 13%; */
  background-color: #fff;
  float:left;
  display: block;
  /* box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26); */
  color: rgb(99, 196, 115);
  font-size: 26px;
  padding-top: 60px;
  padding-left: 40px;
  

}

.half {width: 50%;}

#startButton {
  background-color: #3B13B1;
  /* box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26); */
  line-height: 32px;
  border-radius: 2px;
  border:none;
  outline: none;
  width: 50%;
  color:#fff;
  font-size: 48px;
  padding: 30px 0;
  cursor: pointer;
  font-family:  "Barlow Semi Condensed", sans-serif;;
  font-weight: 400;
  display: block;
margin: auto;}

#startButton:hover {
  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.26), 0 4px 15px 0 rgba(0, 0, 0, 0.26);
  background-color: #107D7A;
}

/* Modal Window Styles */
#modal_window{
  position: absolute;
  top:90px;
  border:1px dashed #3B13B1;
  border-radius: 10px;
  background-color: white;
  width:350;
  z-index: 2000;
  height: auto;
  display: none;
}

.modal_message{
  padding:80px 20px;
}

.modal_message p {
  color:black;
}

.modal_message h2 {
  color: black;
}

.modal_message span {
  float: right;
}

.modal_message div button {
  margin-bottom: 20px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
  line-height: 16px;
  border-radius: 2px;
  font-size: 18px;
  width: 130px;
  outline: none;
  border: none;
  background-color: #3B13B1;
  display: block;
  color: black;
  cursor: pointer;
  text-align: center;
  min-height: 44px;
  padding: 6px;
  font-family:  "Barlow Semi Condensed", sans-serif;;
  font-weight: 400;
  margin-bottom: 100px;
}

.modal_message div button:hover {
  /* box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.26), 0 4px 15px 0 rgba(0, 0, 0, 0.26); */
  background-color: #107D7A;
}

.modal_message div button.twitter {
  background-color: #55acee;
  margin-right: 38px;
}

.modal_message div button.twitter:hover {
  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.26), 0 4px 15px 0 rgba(0, 0, 0, 0.26);
  background-color: #83c3f3
}

.modal_message span.correct {
  color:#4caf50;
}

.modal_message span.incorrect {
  color:#f44336;
}

        </style>
    </head>
    <body>
<div id="stage">
    <div id="container">
      <div id="gameContainer">
         <div id="gameHeader">
           <div class="left questions">
             <div class=""><span></span></div>
           </div>
           <div class="left timer">
             <div class="">TIME: <span></span></div>
           </div>
           <div class="left score">
             <div class="">SCORE: <span></span></div>
           </div>
         </div>
         <div id="gameChoices">
           <div class="row">
             <div class="left half">
               <div class="container"><button id="buttonOne" data-index="0"></button></div>
             </div>
             <div class="left half">
               <div class="container"><button id="buttonTwo" data-index="1"></button></div>
             </div>
           </div>
           <div class="row">
             <div class="left half">
               <div class="container"><button id="buttonThree" data-index="2"></button></div>
             </div>
             <div class="left half">
               <div class="container"><button id="buttonFour" data-index="3"></button></div>
             </div>
           </div>
         </div>
         <h1 id="title">TRIGONOMETRY</h1>
      </div>
      <button id="startButton">START QUIZ</button>
    </div>
  </div>
  <div id="modal_window">
   <div class="modal_message">
     <p></p>
  </div>
<script>
var animationSetup = false;

function animationPipeline() {
  
  /* Variables */
  var self = this,
  w = window.innerWidth,
  h = window.innerHeight,
  stage = document.getElementById('stage'),
  startButton = document.getElementById('startButton'),
  title = document.getElementById('title'),
  questionTitle = document.getElementsByClassName("questions"),
  score = document.getElementsByClassName("score"),
  scoreSpan = score[0].getElementsByTagName('span'),
  timer = document.getElementsByClassName("timer"),
  timerSpan = timer[0].getElementsByTagName('span'),
  gameChoices = document.getElementById('gameChoices'),
  gameHeader = document.getElementById('gameHeader'),
  buttonOne = document.getElementById('buttonOne'),
  buttonTwo = document.getElementById('buttonTwo'),
  buttonThree = document.getElementById('buttonThree'),
  buttonFour = document.getElementById('buttonFour'),
  buttonArray = [buttonOne, buttonTwo, buttonThree, buttonFour],
  modal_window = document.getElementById('modal_window')
  startAnimation = new TimelineMax({repeat:0}),
  gameIndex = 0,
  actualScore = 0,
  timerIndex = 8,
  runningGameAgain = false,
  timerObject = undefined,
  gameQuestions = [],
  // gameMusic = new Audio('http://f5361a5c08a4c03f7c6f-acbeb9602bd0a56bf9c1a6bed3d8280b.r27.cf2.rackcdn.com/math2.mp3'),
  rightAnswer = new Audio('http://f5361a5c08a4c03f7c6f-acbeb9602bd0a56bf9c1a6bed3d8280b.r27.cf2.rackcdn.com/RightSound2%202.mp3'),
  wrongAnser = new Audio('http://f5361a5c08a4c03f7c6f-acbeb9602bd0a56bf9c1a6bed3d8280b.r27.cf2.rackcdn.com/wrongSound2.mp3'),
  questions = [
   'The two main trigonometric functions, sine (sin) and cosine (cos) differ by the addition of the prefix "co" to "cosine." From where does the "co" derive?',
   'The functions cotangent, secant, and cosecant have what relationship to the functions tangent, cosine, and sine (respectively)? ',
   'Angles are measured in degrees or in radians. The conversion factor with which to multiply to convert from degrees to radians is:',
   'The sine function is an odd function (as opposed to even). Which of these statements holds true for a general odd function, f?',
   'The cosine function is an even function (as opposed to odd). Which of these statements holds true for a general even function, f?',
   'There are 8 trigonometric identities called Fundamental Identities. Three of these are called Pythagorean Identities, because they are based on the Pythagorean Theorem. Which of the following is NOT a Pythagorean Identity?',
   'The sum identity for cosine can be summarized as:',
   ' If you know the following data about a triangle and wish to solve the triangle (find all the missing side and/or angle values), which one is ambiguous; i.e., there may be zero, one, or two solutions for the missing values?',
   "Inverses: the relations 'arcsin x'and 'Arcsin x' differ in spelling because the latter's name is capitalized. What is the distinction of the capitalization?",
   ' sin90=',
   
  ],
  answers = [
   ['Constant', 'Coefficient', 'Complementary', 'Constraint'],
   ['Cofunctions', 'Reciprocal', 'Inverse', 'Supplementary'],
   ['180/pi', 'pi/180', '2pi', '1/2pi'],
   ['f(x) = f(-x)', 'f(-x) = -f(x)', 'f(x) = n*f(x), where n is any odd integer', 'f(x) = f(n*x), where n is any odd integer'],
   ['f(-x) = -f(x)', ' f(x) = f(n*x), where n is any even integer', 'f(x) = n*f(x), where n is any even integer', 'f(x) = f(-x)'],
   ['sin^2x + cos^2 x = 1', '1 + tan^2 x = sec^2 x', '1 + cot^2 x = csc^2 x', '1 + sec^2 x = csc^2 x'],
   [' cos(A+B) = cos(A)cos(B) + sin(A)sin(B)', ' cos(A+B) = cos(A)cos(B) - sin(A)sin(B)', 'cos(A+B) = cos(A)sin(B) - sin(A)cos(B)', 'cos(A+B) = cos(A)sin(B) + sin(A)cos(B)'],
   ['Three sides', 'Two angles and any sideIns', 'Two sides and the included angle', 'Two sides and an angle opposite one side'],
   ['no difference', 'capitalized indicates relation is graphed in polar coordinates', 'capitalized indicates return value is in radians', 'capitalized spelling indicates limited range'],
   ['1', '-1', '1', '0'],
  
   
  ],
  correctAnswers = [2,1,1,1,3,3,1,3,3,0],
  gameAnswers = [];

  /**
   * Setup styles and events
   **/
  self._initilize = function() {

   self.windowWasResized();
   // Add click listener to start button 
   startButton.addEventListener('click', self.startGamePlay);

   // Add answer click listener
   for (var i = 0; i < buttonArray.length; i++) {
     buttonArray[i].addEventListener('click', self.anwerClicked, false);
   }
  };

  /**
   * Called everytime the window resizes to calculate new dimensions
   **/
  self.windowWasResized = function() {
   stage.style.height = (h -20) +'px';
   stage.style.width = (w - 20) + 'px';
  };

  /**
   * Setup the stage and fire off the stage animations
   **/
  self.startGamePlay = function() {

   // Get the game indexes
   self.generateGameIndexes();

   // Add data to the interface
   self.setupUserInterfaceWithData();
   // Set the score to zero
   scoreSpan[0].textContent = actualScore;
   timerSpan[0].textContent = timerIndex;

   startAnimation.to([startButton, title], 1, {alpha:0});
   startAnimation.to([startButton, title], 0.1, {css:{display:'none'}});
   startAnimation.to([gameHeader, gameChoices], 0.1, {css:{display:'block'}, onComplete:self.fireOffGameLogic});
  };

  /**
   * Callback function from the startAnimation timeline above
   * This function starts the timer and plays the music at the same time
   **/
  self.fireOffGameLogic = function() {
   self.runTimer();
  //  gameMusic.currentTime = 0;
  //  gameMusic.play();
  }

  /**
   * This function rebuilds the UI with a new question and answer
   **/
  self.setupUserInterfaceWithData = function() {
   // Add questions to buttons
   var ques = questions[gameQuestions[gameIndex]];
   var t = questionTitle[0].getElementsByTagName('span');
   t[0].innerHTML = ques;
   // Add answers to buttons
   var ans = answers[gameQuestions[gameIndex]];
   for (var i = 0; i < ans.length; i++) {
     var a = ans[i];
     buttonArray[i].textContent = a;
   }
  };
  /**
   * Called to start a gameplay timer that runs every second
   **/
  self.runTimer = function() {
   timerObject = window.setInterval(self.updateClock, 1000);
  };
  /**
   * Callback function for the gameplay timer
   **/
  self.updateClock = function() {
   timerIndex--;
   if (timerIndex == -1) {
     timerIndex = 8;
     gameIndex++;
   } 

   if (gameIndex == gameQuestions.length) {
     clearTimeout(timerObject);
     // end the game
     self.runEndOfGame();
     return;
   } else if(timerIndex == 8){
     self.setupUserInterfaceWithData();
   }
   // Display updated time
   timerSpan[0].textContent = timerIndex;
  };

  /**
   * Determines if an answer is correct or incorrect
   * Displays a message to user and plays sound effect
   **/
  self.anwerClicked = function(e) {

   clearTimeout(timerObject);
  //  gameMusic.pause();
  //  gameMusic.currentTime = 0;
   // Get the answer index
   var answerIndex = Number(e.target.getAttribute('data-index'));
   // Get the actual answer index 
   var actualCorrectAnswerIndex = gameAnswers[gameIndex];

   // Correct answer
   if (actualCorrectAnswerIndex == answerIndex) {
     rightAnswer.play();
     actualScore += 10;
     scoreSpan[0].textContent = actualScore;
     cancelButtons = true;
     self.dispatch_modal('YOUR ANSWER IS: <span class="correct">CORRECT!</span>', 1000);
   // Incorrect Answer
   } else {
     wrongAnser.play();
     cancelButtons = true;
     self.dispatch_modal('YOUR ANSWER IS: <span class="incorrect">INCORRECT!</span>', 1000);
   }
  }

  /**
   * This function generates random indexes to be used for our game logic
   * The indexes are used to assign questions and correct answers
   **/
  self.generateGameIndexes = function() {
   var breakFlag = false;
   while (!breakFlag) {
     var randomNumber = Math.floor(Math.random() * 9);
     if (gameQuestions.indexOf(randomNumber) == -1) {
       gameQuestions.push(randomNumber);
       gameAnswers.push(correctAnswers[randomNumber]);
     }
     if (gameQuestions.length == 8) {
       breakFlag = true;
     }
   }
  };

 /**
  *  Dispatches a modal window with a message to user
  */
  self.dispatch_modal = function(message, time) {
   window_width = window.innerWidth|| document.documentElement.clientWidth
                  || document.body.clientWidth;

   modal_window.getElementsByTagName('p')[0].innerHTML = message;
   modal_window.style.left = ((window_width / 2) - 150)+ 'px';

   self.fade_in(time, modal_window, true);
  };

 /**
  * Credit for the idea about fade_in and fade_out to Todd Motto
  * fade_in function emulates the fadeIn() jQuery function
  */
  self.fade_in = function(time, elem, flag) {

   var opacity = 0, interval = 50, 
   gap = interval / time, self = this;
     
   elem.style.display = 'block';
   elem.style.opacity = opacity;
   
   function func() { 
     opacity += gap;
     elem.style.opacity = opacity;
     
     if (opacity >= 1) {
       window.clearInterval(fading);
       //now detect if we need to call fade out
       if (flag) {
         setTimeout(function(){
            self.fade_out(time, elem);
         }, 1500);
       }
     }
   }
   var fading = window.setInterval(func, interval);
  },

 /**
  *  
  * Credit for the idea about fade_in and fade_out to Todd Motto
  * fade_out function emulates the fadeOut() jQuery function
  */
  self.fade_out = function(time, elem) {
   var opacity = 1, interval = 50, gap = interval / time;
       
   function func() { 
     opacity -= gap;
     elem.style.opacity = opacity;
     
     if (opacity <= 0) {
       window.clearInterval(fading); 
       elem.style.display = 'none';
       gameIndex++;
       // Determine if we need to run another game loop
       if (gameIndex != gameQuestions.length) {
         timerIndex = 8;
         timerSpan[0].textContent = timerIndex
         self.setupUserInterfaceWithData();
         self.runTimer();
        //  gameMusic.play();
       } else {
         self.runEndOfGame();
       }
     }
   }  
   var fading = window.setInterval(func, interval);
  };

  /**
   * Runs when the game ends
   * Displays a modal window with the option to tweet score or play again
   **/
  self.runEndOfGame = function() {
 
   window_width = window.innerWidth|| document.documentElement.clientWidth
                  || document.body.clientWidth;
//   var tweetButton = '<button id="tweekScore" class="left twitter" onClick="self.tweetScore()">TWEET SCORE</button>';
//   var tweetButton = '<button id="tweekScore" class="left twitter" onClick="self.tweetScore()">TWEET SCORE</button>';
//    var playAgainButton = '<button id="playAgain" class="left" onClick="self.resetGame()">PLAY AGAIN</button>';
  var submitScoreButton = '<button id="submitScore" class="left" onClick="self.submitScore()">SUBMIT SCORE</button>';
  
   var actualScoreHeader = '<h2>CONGRATS, YOUR FINAL SCORE IS: '+ actualScore + '</h2>';
   var insertedHTML = actualScoreHeader +'<div>' + submitScoreButton + '</div>';
   modal_window.getElementsByTagName('div')[0].innerHTML = insertedHTML;
   modal_window.style.left = ((window_width / 2) - 150)+ 'px';

   self.fade_in(1000, modal_window, false);
  };

  /**
   * The tweets score function allows a user to post their score to twitter
   **/
  self.tweetScore = function() {
   var u = 'https://codepen.io/agnosticdev/pen/ZbWjaB';
   var text = 'I just played Web Trivia Game on @CodePen and scored: ' + actualScore + ' points! @matt_815';
   var url = 'https://twitter.com/intent/tweet?original_referer=' + u + '&url=' + u + '&text=' + text;
   var newWindow = window.open(url, 'name','height=400,width=450');
   if (window.focus) {newWindow.focus()}
   return false;
  }
  /**
   * This function resets the game and starts it all over again
   * This function acts as to reset all data from scratch
   **/
  self.resetGame = function() {

   modal_window.style.opacity = 0.0;
   modal_window.innerHTML = '<div class="modal_message"><p></p></div>';

   window.clearTimeout(timerObject);
   timerObject = undefined;
   gameIndex = 0;
   gameAnswers = [];
   actualScore = 0;
   timerIndex = 8;
   gameQuestions = [];
   // Get the game indexes
   self.generateGameIndexes();

   // Add data to the interface
   self.setupUserInterfaceWithData();
   // Set the score to zero
   scoreSpan[0].textContent = actualScore;
   timerSpan[0].textContent = timerIndex;
   self.runTimer();
  //  gameMusic.currentTime = 0;
  //  gameMusic.play();

  };

  self.submitScore = function() {
    location.replace("storeAssess.jsp?asc=MATH1001&sc=" + actualScore);
  }

  /**
   * Logging Function
   **/
  self.l = function(message) {
   console.log(message);
  };

  // Initialize the functionality of the controller
  self._initilize();

} // End animationPipeline

// Used to call the animationPipline function
var interval = setInterval(function() {
 if(document.readyState === 'complete') {
   clearInterval(interval);
   var pipe = animationPipeline();

   window.onresize = function(event) {
     var pipe = animationPipeline()
   };
 }
}, 100);

</script>
</body>

  </html>
  <%}%>