<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.min.js"></script>		
<?php 
	require_once QA_INCLUDE_DIR.'db/selects.php';
	require_once QA_INCLUDE_DIR.'db/admin.php';
	require_once QA_INCLUDE_DIR.'qa-db.php';	
	require_once QA_INCLUDE_DIR.'app/format.php';
	
	// this function will take the userIds and return usernames in an array. 
	function get_username_by_userid($userids){
		$userNames = array();
		for($i = 0; $i < sizeof($userids); $i++){
			if($userids[$i] == null)
				array_push($userNames,'Visitor');
			else
				{
				$userName=qa_db_read_one_value(qa_db_query_sub('SELECT handle FROM ^users where userid = $',$userids[$i]));
				array_push($userNames,$userName);
				}
			}
		return $userNames;
	}
	
	//Number of categories
	$noOfCategories = qa_db_read_one_value(qa_db_query_sub('select count(*) from ^categories'));

	//Function for the data manupulation of the datasets
	function dataManupulation($lable,$dataset)
	{	
		
		$noOfCategories = qa_db_read_one_value(qa_db_query_sub('select count(*) from ^categories'));
	

		//Creating new array with 0 where the data is not given
		for($k = 0; $k <$noOfCategories ;$k++){
			$tempArr = array();
			$y=0;
			$keys = array_keys($dataset[$k]);
			for($i=0; $i<sizeof($lable); $i++){
				if($y != sizeof($keys) && $keys[$y] == $lable[$i]){
					$tempArr[$keys[$y]] = $dataset[$k][$keys[$y]];
					$y++;	
				}else{
					$tempArr[$lable[$i]] = 0;
				}
			}
			$tempArr1 = array();
			foreach ($tempArr as $key => $value) {
				array_push($tempArr1,$value);
			}
			$manupulatedDataSet[$k] = $tempArr1;

		}
		return $manupulatedDataSet;
	}

	
	/* function dataManupulation1($lable,$dataset,$noOfCategories)
	{	
		
		//Number of categories are the total number of var	

		//Creating new array with 0 where the data is not given
		for($k = 0; $k <$noOfCategories ;$k++){
			$tempArr = array();
			$y=0;
			$keys = array_keys($dataset[$k]);
			for($i=0; $i<sizeof($lable); $i++){
				if($y != sizeof($keys) && $keys[$y] == $lable[$i]){
					$tempArr[$keys[$y]] = $dataset[$k][$keys[$y]];
					$y++;	
				}else{
					$tempArr[$lable[$i]] = 0;
				}
			}
			$tempArr1 = array();
			foreach ($tempArr as $key => $value) {
				array_push($tempArr1,$value);
			}
			$manupulatedDataSet[$k] = $tempArr1;

		}
		return $manupulatedDataSet;
	} */
	
	/* NUMBER OF POSTS BY CATEGORY/DL
		All categries
		category wise questions
		category wise Answers */
		
		$allCategories = qa_db_read_all_values(qa_db_query_sub('select title from ^categories'));
		$qestionsInCategory = qa_db_read_all_values(qa_db_query_sub('select qcount from ^categories'));
		$ansInCategory = qa_db_read_all_values(qa_db_query_sub("SELECT IFNULL(qa2.aswers,0) FROM qa_categories qc LEFT JOIN qa_posts qp ON(qp.categoryid = qc.categoryid AND qp.type='Q') LEFT JOIN (SELECT count(qa.postid) as aswers, qa.categoryid FROM qa_posts qa WHERE qa.type='A' GROUP BY qa.categoryid) qa2 ON (qa2.categoryid = qp.categoryid) GROUP BY qp.categoryid ORDER by qp.categoryid asc"));
		
	

	/* Number Of Messages In Each Category ( Yearly, Quarterly, Monthly,Weekly)
		category wise Answers+comments */

		 // Populating the datasets 
		for ($i=0; $i < $noOfCategories; $i++) { 
			$weeklyDatasetC1[$i] = (qa_db_read_all_values_multiple_rows(qa_db_query_sub("SELECT DATE_FORMAT(created, '%U'),COUNT(type) FROM qa_posts WHERE categoryid = $ GROUP BY DATE_FORMAT(created, '%U')",$i)));
			$monthlyDatasetC1[$i] = qa_db_read_all_values_multiple_rows(qa_db_query_sub("SELECT COUNT(type) FROM qa_posts WHERE categoryid = $ AND type != 'Q' GROUP BY DATE_FORMAT(created, '%M-%y')",$i));
			$quarterlyDatasetC1[$i] = qa_db_read_all_values_multiple_rows(qa_db_query_sub("SELECT COUNT(type) FROM qa_posts WHERE categoryid = $ AND type != 'Q' GROUP BY Quarter(created)",$i));
			$yearlyDatasetC1[$i] = qa_db_read_all_values_multiple_rows(qa_db_query_sub("SELECT COUNT(type) FROM qa_posts WHERE categoryid = $ AND type != 'Q' GROUP BY DATE_FORMAT(created, '%Y')",$i));			
		}

		//Weekly  lable
		$weeklyLable = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created, '%U-%y') FROM qa_posts GROUP BY DATE_FORMAT(created, '%U-%y')")); 
		$weeklyDatasetsC1 = dataManupulation($weeklyLable,$weeklyDatasetC1);
		
		//Monthly lable
		$monthlyLable = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created, '%M-%y') FROM qa_posts WHERE type != 'Q' GROUP BY DATE_FORMAT(created, '%M-%y')"));

		$monthlyDatasetsC1 = dataManupulation($monthlyLable,$monthlyDatasetC1);
		
		//Quarterly lable
		$quarterlyLable = qa_db_read_all_values(qa_db_query_sub("SELECT quarter(created) FROM qa_posts WHERE type != 'Q' GROUP BY quarter(created)"));

		$quarterlyDatasetsC1 = dataManupulation($quarterlyLable,$quarterlyDatasetC1);
				
		//Yearly lable
		$yearlyLable = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created, '%Y') FROM qa_posts WHERE type != 'Q' GROUP BY DATE_FORMAT(created, '%Y')"));		
		
		$yearlyDatasetsC1 = dataManupulation($yearlyLable,$yearlyDatasetC1);
		
		echo "<pre>";
			print_r($weeklyDatasetC1);
			print_r($monthlyDatasetC1);
		echo "</pre>";

		

	
	/* Number Of Searches And Views Overtime ( Yearly, Quarterly, Monthly,Weekly)
		Views */
				
		//For categories use $allcategories from above
		
		$viewsPerCategory = qa_db_read_all_values(qa_db_query_sub("select COUNT(*),userid FROM qa_posts group by categoryid LIMIT 10"));
		
		

	/* Number Of Logged Users ( Yearly, Quarterly, Monthly,Weekly)
		Total number of logged in users
		Increase (as compared to last - Yearly, Quarterly, Monthly,Weekly ) */
		
	//Weekly
	$weeklyLableC2 = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created,'%U-%y') FROM `qa_users` group by DATE_FORMAT(created,'%U-%y')"));
	$weeklyDatasetC2 = qa_db_read_all_values(qa_db_query_sub("SELECT count(*) FROM `qa_users` group by DATE_FORMAT(created,'%U-%y')"));	

	//Monthly
	$monthlyLableC2 = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created,'%M-%y') FROM `qa_users` group by DATE_FORMAT(created,'%M-%y')"));
	$monthlyDatasetC2 = qa_db_read_all_values(qa_db_query_sub("SELECT count(*) FROM `qa_users` group by DATE_FORMAT(created,'%M-%y')"));	
	
	//Quarterly
	$quarterlyLableC2 = qa_db_read_all_values(qa_db_query_sub("SELECT quarter(created) FROM `qa_users` group by quarter(created)"));
	$quarterlyDatasetC2 = qa_db_read_all_values(qa_db_query_sub("SELECT count(*) FROM `qa_users` group by quarter(created)"));

	//Yearly
	$yearlyLableC2 = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(created,'%Y') FROM `qa_users` group by DATE_FORMAT(created,'%Y')"));
	$yearlyDatasetC2 = qa_db_read_all_values(qa_db_query_sub("SELECT count(*) FROM `qa_users` group by DATE_FORMAT(created,'%Y')"));
	
		
	/* TOP Visitors
		Number of searches  and views by top 10 users over time.
	*/
	
	 $highestViewingAndSearchingUsers = qa_db_read_all_values(qa_db_query_sub("select userid from qa_eventlog where (event = 'search' or event = 'q_view') group by userid order by count(*) desc limit 10;"));
		
	//Weekly Lable
	$weeklyLableTV = qa_db_read_all_values(qa_db_query_sub("SELECT DATE_FORMAT(datetime, '%U-%y') FROM qa_eventlog where ((event = 'search' or event = 'q_view') AND userid = 1) GROUP BY DATE_FORMAT(datetime, '%U-%y')"));
	$weeklyUserLables = qa_db_read_all_values(qa_db_query_sub("select count(*) from qa_eventlog where (event = 'search' or event = 'q_view') group by userid order by count(*) desc limit 10;"));
	
	//$weeklyDatasetsC3 = dataManupulation1();
	$weeklyUsersDatasetsC3 =[];
	for( $v = 0; $v < sizeof($highestViewingAndSearchingUsers); $v++ ){
			
			//$weeklyUsersDatasetsC3[$v] = qa_db_read_all_values(qa_db_query_sub("select count(*), DATE_FORMAT(datetime, '%U-%y') FROM qa_eventlog where ((event = 'search' or event = 'q_view') AND userid = $) GROUP BY DATE_FORMAT(datetime, '%U-%y')",$highestViewingAndSearchingUsers[$v]));
		} 
		
	echo "<pre>";
	print_r($weeklyDatasetsC3);
	echo "</pre>";
	
		
	
	
	
	
	
	/* Most Active users 
	Top 10 users with the most points
		Show the number of questions and answers too
	*/
	
	$mostQuestionsCount = qa_db_read_all_values(qa_db_query_sub("SELECT count(qp.postid) FROM qa_users qc LEFT JOIN qa_posts qp ON(qp.userid = qc.userid AND qp.type='Q') LEFT JOIN ( SELECT count(qa.postid) as aswers, qa.userid FROM qa_posts qa WHERE qa.type='A' GROUP BY qa.userid) qa2 ON (qa2.userid = qp.userid) GROUP BY qp.userid ORDER BY count(qp.postid)+ifnull(qa2.aswers,0) DESC LIMIT 10"));
	$mostAnswersCount = qa_db_read_all_values(qa_db_query_sub("SELECT ifnull(qa2.aswers,0) FROM qa_users qc LEFT JOIN qa_posts qp ON(qp.userid = qc.userid AND qp.type='Q') LEFT JOIN ( SELECT count(qa.postid) as aswers, qa.userid FROM qa_posts qa WHERE qa.type='A' GROUP BY qa.userid) qa2 ON (qa2.userid = qp.userid) GROUP BY qp.userid ORDER BY count(qp.postid)+ifnull(qa2.aswers,0) DESC LIMIT 10"));
	$mostActiveUsers = qa_db_read_all_values(qa_db_query_sub("SELECT qc.handle FROM qa_users qc LEFT JOIN qa_posts qp ON(qp.userid = qc.userid AND qp.type='Q') LEFT JOIN ( SELECT count(qa.postid) as aswers, qa.userid FROM qa_posts qa WHERE qa.type='A' GROUP BY qa.userid) qa2 ON (qa2.userid = qp.userid) GROUP BY qp.userid ORDER BY count(qp.postid)+ifnull(qa2.aswers,0) DESC LIMIT 10"));
	
	/* print_r($mostQuestionsCount);
	print_r($mostActiveUsers);  */
	
	
	/* Most responsive users
		The users with the most answers		
	*/
	$mostResponseCount = qa_db_read_all_values(qa_db_query_sub("select COUNT(postid),userid FROM qa_posts where type = 'A' group by userid ORDER BY COUNT(postid) DESC LIMIT 10"));
	$mostResponsiveUsers = get_username_by_userid(qa_db_read_all_values(qa_db_query_sub("select userid FROM qa_posts where type = 'A' group by userid ORDER BY COUNT(postid) DESC LIMIT 10")));
	
	
?>	
<script>
/*CONTENT CREATION - No of messages in each category - C1
================================================================*/

//---------------------------------- Weekly

var ctx = document.getElementById('weeklyc1').getContext('2d');
var weeklydatasetsc1 = <?php echo json_encode($weeklyDatasetsC1);?>;
var weeklylablec1 = <?php echo json_encode($weeklyLable);?>;
var datasets1 = [];
for(var i = 0; i < weeklydatasetsc1.length ; i++ ){
	datasets1[i]={};
	datasets1[i].data = weeklydatasetsc1[i];
	datasets1[i].label = weeklylablec1[i];
	datasets1[i].backgroundColor = "rgba(153,255,51,0.4)";
}

var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: weeklylablec1,
    datasets: datasets1
  }
});

//---------------------------------- Monthly

var ctx = document.getElementById('monthlyc1').getContext('2d');
var monthlydatasetsc1 = <?php echo json_encode($monthlyDatasetsC1);?>;
var monthlylablec1 = <?php echo json_encode($monthlyLable);?>;

var datasets2 = [];
for(var i = 0; i < monthlydatasetsc1.length ; i++ ){
	datasets2[i]={};
	datasets2[i].data = monthlydatasetsc1[i];
	datasets2[i].label = monthlylablec1[i];
	datasets2[i].backgroundColor = "rgba(153,255,51,0.4)";
}

var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: monthlylablec1,
    datasets: datasets2
  }
});
	

//---------------------------------- quarter

var ctx = document.getElementById('quarterlyc1').getContext('2d');
var quarterlydatasetsc1 = <?php echo json_encode($quarterlyDatasetsC1);?>;
var quarterlylablec1 = <?php echo json_encode($quarterlyLable);?>;
var datasets3 = [];
for(var i = 0; i < quarterlydatasetsc1.length ; i++ ){
	datasets3[i]={};
	datasets3[i].data = quarterlydatasetsc1[i];
	datasets3[i].label = quarterlylablec1[i];
	datasets3[i].backgroundColor = "rgba(153,255,51,0.4)";
}

var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: quarterlylablec1,
    datasets: datasets3
  }
});

//---------------------------------- Yearly

var ctx = document.getElementById('yearlyc1').getContext('2d');
var yearlydatasetsc1 = <?php echo json_encode($yearlyDatasetsC1);?>;
var yearlylablec1 = <?php echo json_encode($yearlyLable);?>;
var datasets4 = [];
for(var i = 0; i < yearlydatasetsc1.length ; i++ ){
	datasets4[i]={};
	datasets4[i].data = yearlydatasetsc1[i];
	datasets4[i].label = yearlylablec1[i];
	datasets4[i].backgroundColor = "rgba(153,255,51,0.4)";
}

var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: yearlylablec1,
    datasets: datasets4
  }
}); 
	
	
// USERS LOGGED ON PER WEEK ====================================================================

var ctx = document.getElementById("usersPerWeek");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($weeklyLableC2);?>,
        datasets: [{	
            label: 'First datasets',
			fillColor: "#FC9775",
            data: <?php echo json_encode($weeklyDatasetC2);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			}
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

// USERS LOGGED ON PER Quarter ====================================================================

var ctx = document.getElementById("usersPerQuarter");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($quarterlyLableC2);?>,
        datasets: [{	
            label: 'Users',
			fillColor: "#FC9775",
            data: <?php echo json_encode($quarterlyDatasetC2);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			}
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
// USERS LOGGED ON PER Month ====================================================================

var ctx = document.getElementById("usersPerMonth");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($monthlyLableC2);?>,
        datasets: [{	
            label: 'Users',
			fillColor: "#FC9775",
            data: <?php echo json_encode($monthlyDatasetC2);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			}
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
// USERS LOGGED ON PER Year ====================================================================

var ctx = document.getElementById("usersPerYear");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($yearlyLableC2);?>,
        datasets: [{	
            label: 'Users',
			fillColor: "#FC9775",
            data: <?php echo json_encode($yearlyDatasetC2);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			}
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});


// ====================================================================
var ctx = document.getElementById("viewByCategory");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($allCategories);?>,
        datasets: [{	
            label: 'Users',
			fillColor: "#FC9775",
            data: <?php echo json_encode($viewsPerCategory);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			}
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});


// ====================================================================
var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($allCategories);?>,
        datasets: [{	
            label: 'Questions',
			fillColor: "#FC9775",
            data: <?php echo json_encode($qestionsInCategory);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			},
			{
        label: "Answers",
        fillColor: "#5A69A6",
        data: <?php echo json_encode($ansInCategory);?>,
		backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
    }
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});


var ctx = document.getElementById("mostResponsiveUsers");
var myChart = new Chart(ctx, {
			  type: 'bar',
			  data: {
				labels: <?php echo json_encode($mostResponsiveUsers); ?>,
				datasets: [{
				  label: 'Responses',
				  
				  data: <?php echo json_encode($mostResponseCount); ?>,
				  backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				  ],
				  borderColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				  ],
				  borderWidth: 1
				}]
			  },
			  options: {
				scales: {
				  yAxes: [{
					ticks: {
					  beginAtZero: true
					}
				  }]
				}
			  }
			});


			

/* MOST ACTIVE USERS 
================================*/

var ctx = document.getElementById("mostActiveUsers");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($mostActiveUsers);?>,
        datasets: [{	
            label: 'Questions',
			fillColor: "#FC9775",
            data: <?php echo json_encode($mostQuestionsCount);?>,
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
			
			},
			{
        label: "Answers",
        fillColor: "#5A69A6",
        data: <?php echo json_encode($mostAnswersCount);?>,
		backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
    }
			
            ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
		
			


			
</script>
