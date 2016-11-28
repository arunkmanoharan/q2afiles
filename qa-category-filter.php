<?php
/**
	Nimeyo Theme
	File: qa-category-filter.php
	Description: Contains the controller for Category filter in side menu
**/

class qa_nimeyo_category_filter
{
	public function allow_template($template)
	{
		return true;
	}

	public function allow_region($region)
	{
		return ($region=='side');
	}

	public function output_widget($region, $place, $themeobject, $template, $request, $qa_content)
	{
		
		require_once QA_INCLUDE_DIR.'db/selects.php';


		$categoryid=qa_post_text('categoryid');
		if (!strlen($categoryid))
			$categoryid=null;

		list($fullcategory, $categories)=qa_db_select_with_pending(
			qa_db_full_category_selectspec($categoryid, true),
			qa_db_category_sub_selectspec($categoryid)
		);

	
		echo qa_html(strtr(@$fullcategory['content'], "\r\n", '  ')); // category description

		$themeobject->output('<div class="heading">filter by category</div>
			<div class="content">
			<form class="category-form" role="search" method="post">
				<ul class = "category-list">');
		foreach ($categories as $category) {
			$themeobject->output('<li class="border"> 
									<input id="'.$category['categoryid'].'" type="checkbox" name="check" onChange="this.form.submit()" />

									<label for='.$category['categoryid'].'><span><span></span></span>'.$category['title'].' </label>
								</li>');
		}
			$active = isset($_POST['check']) && $_POST['check']  ? "1" : "0";
			$isChecked = false;
  			
  			if(isset($_POST['check'])){
    			if($_POST['check'] == 'on'){
      				$isChecked = true;
    			}      
    			echo $active;
  			}




			// echo"<script>  
   // 					 $(function(){
   //  					$('.checkbox').on('change',function(){
   //     						$('#category-form').submit();
   //      				});
   //  				});
			// </script>";

	/*		echo"<script>
					function calc()
						{
  							if (document.getElementById('".$category['categoryid']."').checked) 
 								 {
      								alert('Hello');
  								} 
						}
					}
			</script>"; */
		
				$themeobject->output('
				</ul>
				<a href="#" class = "category-link">View All categories</a>
				
					<div class="input-group search">
						<input type="text" class="form-control" placeholder="Search Categories" name="q">
						<div class="input-group-btn">
							<button class="btn btn-default search-btn" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>');			
	}
}
