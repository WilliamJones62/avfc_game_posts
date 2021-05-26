function showMatch() {
  var opponent = document.getElementById("opponent");
  var ha = document.getElementById("ha");
  var score = document.getElementById("score");
  var date = document.getElementById("date");
  var avgRating = document.getElementById("avgRating");
  var resp = JSON.parse(this.responseText);
  opponent.innerHTML = resp["opponent"] + " ";
  score.innerHTML = resp["score"] + " ";
  date.innerHTML = resp["formatted_date"] + " ";
  avgRating.innerHTML = resp["rating"];
  ha.innerHTML = "Away ";
  if (resp["home"]) {
    ha.innerHTML = "Home ";
  }
  // need to clear the previous reviews table, then reload it with the reviews for the new match
  var table = document.getElementById('prevReviews');
  var rowCount = table.rows.length;
  for (var i = 1; i < rowCount; i++) {
    table.deleteRow(1);
  }
  var reviews = resp["reviews"];
  var reviewCount = reviews.length;
  for (var i = 0; i < reviewCount; i++) {
    row = table.insertRow(-1);
    cell1 = row.insertCell(0);
    cell2 = row.insertCell(1);
    cell3 = row.insertCell(2);
    cell1.innerHTML = reviews[i].title;
    cell2.innerHTML = reviews[i].description;
    cell3.innerHTML = reviews[i].rating;
  }
}

function anotherMatch() {
  var matchData = document.getElementById("matches");
  var value = matchData.options[matchData.selectedIndex].value;
  var arr = value.split(" ");
  var formattedDate = arr[arr.length-1]
  var req = new XMLHttpRequest();
  const url = `/api/v1/games/${formattedDate}`;
  req.addEventListener('load', showMatch);
  req.open('GET', url);
  req.send();
}

function addReview() {
  var title = document.forms["review"]["title"].value;
  var description = document.forms["review"]["description"].value;
  var rating = document.forms["review"]["rating"].value;
  var date = document.getElementById("date");
  var formattedDate = date.innerHTML;
  formattedDate = formattedDate.trim();
  var req = new XMLHttpRequest();
  const url = `/api/v1/reviews`;
  var data = `{
    "review":{
    "title": "${title}",
    "description": "${description}",
    "rating": "${rating}",
    "formatted_date": "${formattedDate}"
    }
  }`;
  req.open("POST", url);
  req.setRequestHeader("Accept", "application/json");
  req.setRequestHeader("Content-Type", "application/json");
  req.onreadystatechange = function () {
     if (req.readyState === 4) {
       // successfully added review now update the list of reviews with the new review
       var table = document.getElementById("prevReviews");
       var row = table.insertRow(-1);
       var cell1 = row.insertCell(0);
       var cell2 = row.insertCell(1);
       var cell3 = row.insertCell(2);
       cell1.innerHTML = title;
       cell2.innerHTML = description;
       cell3.innerHTML = rating;
     }
   }
  req.send(data);
  document.forms["review"]["title"].value = '';
  document.forms["review"]["description"].value = '';
  document.forms["review"]["rating"].value = '';
}
