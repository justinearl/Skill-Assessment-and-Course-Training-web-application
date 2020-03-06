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
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Basic Circuits</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet prefetch" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet prefetch" href="https://fonts.googleapis.com/css?family=Coda">
    <link rel="stylesheet prefetch" href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah|Permanent+Marker" >

    <style>
    html {
	box-sizing: border-box;
}

*,
*::before,
*::after {
	box-sizing: inherit;
}

html,
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background: #ffffff;
	font-family: 'Permanent Marker', cursive;
	font-size: 16px;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h1 {
	font-family: 'Gloria Hallelujah', cursive;
}




/*
 * Styles for the deck of cards
 */


.deck {
	width: 85%;
	background: #716F71;
	padding: 1rem;
	border-radius: 4px;
	box-shadow: 8px 9px 26px 0 rgba(46, 61, 73, 0.5);
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	align-items: center;
	margin: 0 0 3em;
}

.deck .card {
	height: 3.7rem;
	width: 3.7rem;
	margin: 0.2rem 0.2rem;
	background: #141214;;
	font-size: 0;
	color: #ffffff;
	border-radius: 5px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 5px 2px 20px 0 rgba(46, 61, 73, 0.5);
}

.deck .card.open {
	transform: rotateY(0);
	background: #02b3e4;
	cursor: default;
	animation-name: flipInY;
	-webkit-backface-visibility: visible !important;
	backface-visibility: visible !important;
	animation-duration: .75s;
}

.deck .card.show {
	font-size: 33px;
}

.deck .card.match {
	cursor: default;
	background: #E5F720;
	font-size: 33px;
	animation-name: rubberBand;
	-webkit-backface-visibility: visible !important;
	backface-visibility: visible !important;
	animation-duration: .75s;
}

.deck .card.unmatched {
	animation-name: pulse;
	-webkit-backface-visibility: visible !important;
	backface-visibility: visible !important;
	animation-duration: .75s;
	background: #e2043b;
}

.deck .card.disabled {
	pointer-events: none;
	opacity: 0.9;
    font-size: 16px;
}


/*
 * Styles for the Score Panel
 */


.score-panel {
	text-align: left;
	margin-bottom: 10px;
}

.score-panel .stars {
	margin: 0;
	padding: 0;
	display: inline-block;
	margin: 0 5px 0 0;
}

.score-panel .stars li {
	list-style: none;
	display: inline-block;
}

.score-panel .restart {
	float: right;
	cursor: pointer;
}

.fa-star {
	color: #FFD700;
}

.timer {
	display: inline-block;
	margin: 0 1rem;
}


/*
 * Styles for congratulations modal
 */


.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}
  
.popup {
	margin: 70px auto;
	padding: 20px;
	background: #ffffff;
	border-radius: 5px;
	width: 85%;
	position: relative;
	transition: all 5s ease-in-out;
	font-family: 'Gloria Hallelujah', cursive;
}
  
.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}

.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.popup .close:hover {
	color: #E5F720;
}

.content-2 {
    font-size: 20px;
    background-color: white;
}

.popup .content-1,
.content-2 {
	max-height: 30%;
	overflow: auto;
	text-align: center;
}

.show {
	visibility: visible !important;
	opacity: 100 !important;
}

#starRating li {
	display: inline-block;
}

#play-again {
	background-color: #141214;
	padding: 0.7rem 1rem;
	font-size: 1.1rem;
	display: block;
	margin: 0 auto;
	width: 50%;
	font-family: 'Gloria Hallelujah', cursive;
	color: #ffffff;
	border-radius: 5px;
}

#submit {
	background-color: #141214;
	padding: 0.7rem 1rem;
	font-size: 1.1rem;
	display: block;
	margin: 0 auto;
	width: 50%;
	font-family: 'Gloria Hallelujah', cursive;
	color: #ffffff;
	border-radius: 5px;
}

/* animations */
@keyframes flipInY {
	from {
		transform: perspective(400px) rotate3d(0, 1, 0, 90deg);
		animation-timing-function: ease-in;
		opacity: 0;
	}

	40% {
		transform: perspective(400px) rotate3d(0, 1, 0, -20deg);
		animation-timing-function: ease-in;
	}

	60% {
		transform: perspective(400px) rotate3d(0, 1, 0, 10deg);
		opacity: 1;
	}

	80% {
		transform: perspective(400px) rotate3d(0, 1, 0, -5deg);
	}

	to {
		transform: perspective(400px);
	}
}

@keyframes rubberBand {
	from {
		transform: scale3d(1, 1, 1);
	}

	30% {
		transform: scale3d(1.25, 0.75, 1);
	}

	40% {
		transform: scale3d(0.75, 1.25, 1);
	}

	50% {
		transform: scale3d(1.15, 0.85, 1);
	}

	65% {
		transform: scale3d(.95, 1.05, 1);
	}

	75% {
		transform: scale3d(1.05, .95, 1);
	}

	to {
		transform: scale3d(1, 1, 1);
	}
}

@keyframes pulse {
	from {
		transform: scale3d(1, 1, 1);
	}

	50% {
		transform: scale3d(1.2, 1.2, 1.2);
	}

	to {
		transform: scale3d(1, 1, 1);
	}
}


/****** Media queries
***************************/


@media (max-width: 320px) {
	.deck {
		width: 85%;
	}

	.deck .card {
		height: 4.7rem;
		width: 4.7rem;
	}
}


/* For Tablets and larger screens
****************/

@media (min-width: 768px) {
	.container {
		font-size: 22px;
	}

	.deck {
		width: 660px;
		height: 680px;
	}

	.deck .card {
		height: 125px;
		width: 125px;
	}

	.popup {
		width: 60%;
        font-size: 2px;
	}
}


    </style>
</head>
<body>

    <div class="container">
        <header>
            <h1>Match the elecrical quantity and its unit!</h1>
        </header>

        <section class="score-panel">
        	<ul class="stars">
        		<li><i class="fa fa-star"></i></li>
        		<li><i class="fa fa-star"></i></li>
        		<li><i class="fa fa-star"></i></li>
        	</ul>

        	<span class="moves">0</span> Move(s)

            <div class="timer">
            </div>

            <div class="restart" onclick=startGame()>
        		<i class="fa fa-repeat"></i>
        	</div>
        </section>

        <ul class="deck" id="card-deck">
            <li class="card" type="current">
               <p>Current</p>
            </li>
            <li class="card" type="resis">
                <p>Resistance</p>
            </li>
            <li class="card match" type="watt">
                <p>Electric<br>Power</p>
            </li>
            <li class="card" type="cap" >
                <p>Capacitance</p>
            </li>
            <li class="card" type="induc">
                <p>Inductance</p>
            </li>
            <li class="card match" type="watt">
                <p>Watt</p>
            </li>
            <li class="card" type="volt">
                <p>Voltage</p>
            </li>
            <li class="card" type="admit">
                <p>mho</p>
            </li>
            <li class="card" type="current">
                <p>Ampere</p>
            </li>
            <li class="card" type="conduc">
                <p>Conductance</p>
            </li>
            <li class="card" type="conduc">
                <p>siemens</p>
            </li>
            <li class="card" type="volt">
                <p>Volt</p>
            </li>
            <li class="card open show" type="cap">
                <p>Farad</p>
            </li>
            <li class="card" type="admit">
                <p>Admittance</p>
            </li>
            <li class="card" type="resis">
                <p>Ohm</p>
            </li>
            <li class="card" type="induc">
                <p>Henry</p>
            </li>
        </ul>

        <div id="popup1" class="overlay">
            <div class="popup">
                <a class="close" href=# >x</a>
                <div class="content-1">
                    Congratulations you're a winner
 				</div>
                <div class="content-2">
                    <p>You made <span id=finalMove> </span> moves </p>
                    <p>in <span id=totalTime> </span> </p>
                    <p>Rating:  <span id=starRating></span></p>
                </div>
                <!-- <button id="play-again"onclick="playAgain()">
                    Play again</a>
                </button> -->
                <button id="submit"onclick="submitScore()">
                    Next</a>
                </button>
            </div>
        </div>

    </div>
    <script>
        // cards array holds all cards
let card = document.getElementsByClassName("card");
let cards = [...card];

// deck of all cards in game
const deck = document.getElementById("card-deck");

// declaring move variable
let moves = 0;
let counter = document.querySelector(".moves");

// declare variables for star icons
const stars = document.querySelectorAll(".fa-star");

// declaring variable of matchedCards
let matchedCard = document.getElementsByClassName("match");

 // stars list
 let starsList = document.querySelectorAll(".stars li");

 // close icon in modal
 let closeicon = document.querySelector(".close");

 // declare modal
 let modal = document.getElementById("popup1")

 // array for opened cards
var openedCards = [];


// @description shuffles cards
// @param {array}
// @returns shuffledarray
function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    while (currentIndex !== 0) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
};

function submitScore(){
    location.replace("storeAssess.jsp?asc=ELEC1001&sc=" + tScore);
}


// @description shuffles cards when page is refreshed / loads
document.body.onload = startGame();


// @description function to start a new play 
function startGame(){
 
    // empty the openCards array
    openedCards = [];

    // shuffle deck
    cards = shuffle(cards);
    // remove all exisiting classes from each card
    for (var i = 0; i < cards.length; i++){
        deck.innerHTML = "";
        [].forEach.call(cards, function(item) {
            deck.appendChild(item);
        });
        cards[i].classList.remove("show", "open", "match", "disabled");
    }
    // reset moves
    moves = 0;
    counter.innerHTML = moves;
    // reset rating
    for (var i= 0; i < stars.length; i++){
        stars[i].style.color = "#FFD700";
        stars[i].style.visibility = "visible";
    }
    //reset timer
    second = 0;
    minute = 0; 
    hour = 0;
    var timer = document.querySelector(".timer");
    timer.innerHTML = "0 mins 0 secs";
    clearInterval(interval);
}


// @description toggles open and show class to display cards
var displayCard = function (){
    this.classList.toggle("open");
    this.classList.toggle("show");
    this.classList.toggle("disabled");
};


// @description add opened cards to OpenedCards list and check if cards are match or not
function cardOpen() {
    openedCards.push(this);
    var len = openedCards.length;
    if(len === 2){
        moveCounter();
        if(openedCards[0].type === openedCards[1].type){
            matched();
        } else {
            unmatched();
        }
    }
};


// @description when cards match
function matched(){
    openedCards[0].classList.add("match", "disabled");
    openedCards[1].classList.add("match", "disabled");
    openedCards[0].classList.remove("show", "open", "no-event");
    openedCards[1].classList.remove("show", "open", "no-event");
    openedCards = [];
}


// description when cards don't match
function unmatched(){
    openedCards[0].classList.add("unmatched");
    openedCards[1].classList.add("unmatched");
    disable();
    setTimeout(function(){
        openedCards[0].classList.remove("show", "open", "no-event","unmatched");
        openedCards[1].classList.remove("show", "open", "no-event","unmatched");
        enable();
        openedCards = [];
    },1100);
}


// @description disable cards temporarily
function disable(){
    Array.prototype.filter.call(cards, function(card){
        card.classList.add('disabled');
    });
}


// @description enable cards and disable matched cards
function enable(){
    Array.prototype.filter.call(cards, function(card){
        card.classList.remove('disabled');
        for(var i = 0; i < matchedCard.length; i++){
            matchedCard[i].classList.add("disabled");
        }
    });
}

var tScore = 100;
// @description count player's moves
function moveCounter(){
    moves++;
    counter.innerHTML = moves;
    //start timer on first click
    if(moves == 1){
        second = 0;
        minute = 0; 
        hour = 0;
        startTimer();
    }
    // setting rates based on moves
    if (moves > 8 && moves < 12){
        for( i= 0; i < 3; i++){
            if(i > 1){
                stars[i].style.visibility = "collapse";
            }
        }
        tScore = 60;
    }
    else if (moves > 13){
        for( i= 0; i < 3; i++){
            if(i > 0){
                stars[i].style.visibility = "collapse";
            }
        }
        tScore = 30;
    }
}


// @description game timer
var second = 0, minute = 0; hour = 0;
var timer = document.querySelector(".timer");
var interval;
function startTimer(){
    interval = setInterval(function(){
        timer.innerHTML = minute+"mins "+second+"secs";
        second++;
        if(second == 60){
            minute++;
            second=0;
        }
        if(minute == 60){
            hour++;
            minute = 0;
        }
    },1000);
}


// @description congratulations when all cards match, show modal and moves, time and rating
function congratulations(){
    if (matchedCard.length == 16){
        clearInterval(interval);
        finalTime = timer.innerHTML;

        // show congratulations modal
        modal.classList.add("show");

        // declare star rating variable
        var starRating = document.querySelector(".stars").innerHTML;

        //showing move, rating, time on modal
        document.getElementById("finalMove").innerHTML = moves;
        document.getElementById("starRating").innerHTML = starRating;
        document.getElementById("totalTime").innerHTML = finalTime;

        //closeicon on modal
        closeModal();
    };
}


// @description close icon on modal
function closeModal(){
    closeicon.addEventListener("click", function(e){
        modal.classList.remove("show");
        startGame();
    });
}


// @desciption for user to play Again 
function playAgain(){
    modal.classList.remove("show");
    startGame();
}


// loop to add event listeners to each card
for (var i = 0; i < cards.length; i++){
    card = cards[i];
    card.addEventListener("click", displayCard);
    card.addEventListener("click", cardOpen);
    card.addEventListener("click",congratulations);
}

    </script>

</body>
</html>
<%}%>