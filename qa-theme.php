<?php

class qa_html_theme extends qa_html_theme_base
{
	// use new ranking layout
	protected $ranking_block_layout = true;

	// outputs login form if user not logged in
	public function nav_user_search()
	{
		if (!qa_is_logged_in()) {
			if (isset($this->content['navigation']['user']['login']) && !QA_FINAL_EXTERNAL_USERS) {
				$login = $this->content['navigation']['user']['login'];
				$this->output(
					'<form class="qam-login-form" action="'.$login['url'].'" method="post">',
						'<input type="text" class="qam-login-text" name="emailhandle" dir="auto" placeholder="'.trim(qa_lang_html(qa_opt('allow_login_email_only') ? 'users/email_label' : 'users/email_handle_label'), ':').'"/>',
						'<input type="password" class="qam-login-text" name="password" dir="auto" placeholder="'.trim(qa_lang_html('users/password_label'), ':').'"/>',
						'<div class="qam-rememberbox"><input type="checkbox" name="remember" id="qam-rememberme" value="1"/>',
						'<label for="qam-rememberme" class="qam-remember"><span>'.qa_lang_html('users/remember').'</span></label></div>',
						'<input type="hidden" name="code" value="'.qa_html(qa_get_form_security_code('login')).'"/>',
						'<input type="submit" value="' . qa_lang_html('users/login_button') . '" class="qa-form-tall-button qa-form-tall-button-login" name="dologin"/>',
					'</form>'
				);

				// remove regular navigation link to log in page
				unset($this->content['navigation']['user']['login']);
			}
		}

		qa_html_theme_base::nav_user_search();
	}

	public function logged_in()
	{
		/*if (qa_is_logged_in()) // output user avatar to login bar
			$this->output(
				'<div class="qa-logged-in-avatar">',
				QA_FINAL_EXTERNAL_USERS
				? qa_get_external_avatar_html(qa_get_logged_in_userid(), 24, true)
				: qa_get_user_avatar_html(qa_get_logged_in_flags(), qa_get_logged_in_email(), qa_get_logged_in_handle(),
					qa_get_logged_in_user_field('avatarblobid'), qa_get_logged_in_user_field('avatarwidth'), qa_get_logged_in_user_field('avatarheight'),
					24, true),
				'</div>'
			);

		//qa_html_theme_base::logged_in();

		if (qa_is_logged_in()) { // adds points count after logged in username
			$userpoints=qa_get_logged_in_points();

			$pointshtml=($userpoints==1)
				? qa_lang_html_sub('main/1_point', '1', '1')
				: qa_lang_html_sub('main/x_points', qa_html(number_format($userpoints)));

			$this->output(
				'<span class="qa-logged-in-points">',
				'('.$pointshtml.')',
				'</span>'
			);
		}*/
	}

	public function doctype()
	{
		$this->output('<!DOCTYPE html>');
	}

	public function html()
	{
		$this->output('<html>');

		$this->head();
		$this->body();

		$this->output('</html>');
	}

	public function head()
	{
		$this->output(
			'<head>',
			'<meta charset="'.$this->content['charset'].'"/>'
		);

		$this->head_title();
		$this->head_metas();
		$this->head_css();
		$this->head_links();
		$this->head_lines();
		$this->head_script();
		$this->head_custom();

		$this->output('</head>');
	}

	public function head_title()
	{
		$pagetitle = strlen($this->request) ? strip_tags(@$this->content['title']) : '';
		$headtitle = (strlen($pagetitle) ? ($pagetitle.' - ') : '').$this->content['site_title'];

		$this->output('<title>'.$headtitle.'</title>');
	}

	public function head_metas()
	{
		if (strlen(@$this->content['description']))
			$this->output('<meta name="description" content="'.$this->content['description'].'"/>');

		if (strlen(@$this->content['keywords'])) // as far as I know, meta keywords have zero effect on search rankings or listings
			$this->output('<meta name="keywords" content="'.$this->content['keywords'].'"/>');
	}

	public function head_links()
	{
		if (isset($this->content['canonical']))
			$this->output('<link rel="canonical" href="'.$this->content['canonical'].'"/>');

		if (isset($this->content['feed']['url']))
			$this->output('<link rel="alternate" type="application/rss+xml" href="'.$this->content['feed']['url'].'" title="'.@$this->content['feed']['label'].'"/>');

		// convert page links to rel=prev and rel=next tags
		if (isset($this->content['page_links']['items'])) {
			foreach ($this->content['page_links']['items'] as $page_link) {
				if (in_array($page_link['type'], array('prev', 'next')))
					$this->output('<link rel="' . $page_link['type'] . '" href="' . $page_link['url'] . '" />');
			}
		}
	}

	public function head_script()
	{
		if (isset($this->content['script'])) {
			foreach ($this->content['script'] as $scriptline)
				$this->output_raw($scriptline);
		}
		$this->output('<script type="text/javascript" src = "'.$this->rooturl.'js/jquery-2.2.4.js"></script>');
		$this->output('<script type="text/javascript" src = "'.$this->rooturl.'js/jquery.cookie.js"></script>');
		$this->output('<script type="text/javascript" src = "'.$this->rooturl.'js/bootstrap.js"></script>');
		$this->output('<script type="text/javascript" src = "'.$this->rooturl.'js/script.js"></script>');
	}

	public function head_css()
	{
		$this->output('<link rel="stylesheet" href="'.$this->rooturl.$this->css_name().'"/>');

		$this->output('<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600" rel="stylesheet" type="text/css"/>');

		
		$this->output('<link rel="stylesheet" type="text/css" href="'.$this->rooturl.'css/bootstrap.css"/>');
		$this->output('<link rel="stylesheet" type="text/css" href="'.$this->rooturl.'css/style.css"/>');
		$this->output('<link rel="stylesheet" type="text/css" href="'.$this->rooturl.'css/theme.css"/>');
		$this->output('<link rel="stylesheet" type="text/css" href="'.$this->rooturl.'css/responsive.css"/>');

		
		if (!empty($this->content['notices'])) {
			$this->output(
				'<style>',
				'.qa-body-js-on .qa-notice {display:none;}',
				'</style>'
			);
		}
	}

	public function css_name()
	{
		return 'qa-styles.css?'.QA_VERSION;
	}

	public function head_lines()
	{
		if (isset($this->content['head_lines'])) {
			foreach ($this->content['head_lines'] as $line)
				$this->output_raw($line);
		}
	}

	public function head_custom()
	{
		// abstract method
	}

	public function body()
	{
		
		$this->logged_in();
		$this->output('<body');
		$this->body_tags();
		$this->output('>');

		
		$this->body_script();
		$this->body_header();
		$this->body_submenu();
		
		$this->body_banner();
		
		$this->body_content();
		$this->body_footer();
		$this->body_hidden();
		

		$this->output('</body>');
	}
	
	public function body_tags()
	{
		
		if($this->template=='user' || $this->template=='users')
		$this->output('class="body-gray"');
	}
	
	
	
	
	
	// adds login bar, user navigation and search at top of page in place of custom header content
	public function body_header()
	{
		
		$this->output('<nav class="navbar navbar-default navbar-fixed-top navbar-upper">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-upper" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="'.$this->rooturl.'images/logo.png"></a>
			</div>
			<div id="navbar-upper" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
				
				<ul class="nav navbar-nav navbar-right" style = "">');
				
				if (qa_is_logged_in()) {
					$this->output(
						'<li>',
						QA_FINAL_EXTERNAL_USERS
						? qa_get_external_avatar_html(qa_get_logged_in_userid(), 24, true)
						: qa_get_user_avatar_html(qa_get_logged_in_flags(), qa_get_logged_in_email(), qa_get_logged_in_handle(),
							qa_get_logged_in_user_field('avatarblobid'), qa_get_logged_in_user_field('avatarwidth'), qa_get_logged_in_user_field('avatarheight'),
							24, true),
						'</li>'
					);
					$userpoints=qa_get_logged_in_points();

					$pointshtml=($userpoints==1)
						? qa_lang_html_sub('main/1_point', '1', '1')
						: qa_lang_html_sub('main/x_points', qa_html(number_format($userpoints)));
					$userhandle = qa_get_logged_in_handle();
					
					$this->output(
						'<li><a href="'.qa_path_html('account').'" class = "border qa-user-link">',
						$userhandle.' ('.$pointshtml.')',
						'</a></li>'
					);
					$this->output('<li><a href="'.$this->content['navigation']['user']['logout']['url'].'" class = "border">Logout</a></li>');
					
						//$userpoints = qa_get_logged_in_points();
						 
						//$this->output($userhandle . ' ' .$userpoints);
					
				} else {
		
						$this->output('<li><a href="'.$this->content['navigation']['user']['login']['url'].'" class = "border">Sign In</a></li>
						<li><a href="'.$this->content['navigation']['user']['register']['url'].'" class = "border">Sign Up</a></li>');
				}
				$this->output('<li><a href="#">Help</a></li>
				<li>
					<form class="navbar-form" role="search">
						<div class="input-group">
							<input type="hidden" name="qa" value="search" />
							<input type="text" name="q" class="form-control" placeholder="Search Q & A" name="q">
							<div class="input-group-btn">
								<button class="btn btn-default search-btn" type="submit">
									<i class="glyphicon glyphicon-search"></i></button>
								</div>
							</div>
						</form>
					</li>
				</ul>

				<div class="col-sm-3 pull-right">

				</div>
			</div><!--/.nav-collapse -->
		</div>
	</nav>');
		
		

		//qa_html_theme_base::logged_in();

		
		//$this->output('<div class="qam-login-bar"><div class="qam-login-group">');
		//$this->nav_user_search();
		//$this->logged_in();
		//$this->output('</div></div>');*/
		//qa_html_theme_base::nav_user_search();
	}

	
		
	//adds submenu in the homepage
	public function body_submenu() {
		$this->output('<nav class="navbar navbar-default navbar-lower">
			<div class="container">

				<div id="navbar-lower" class="" aria-expanded="false" style="height: 35px;">');
				$this->nav('main');
/*
					<ul class="nav navbar-nav">
						<li><a href="'.qa_path_html('questions').'">Questions</a></li>
						<li><a href="'.qa_path_html('tags').'">Tags</a></li>
						<li><a href="'.qa_path_html('users').'">Users</a></li>
						<li><a href="'.qa_path_html('ask').'">Ask</a></li>
						<li><a href="'.qa_path_html('dashboard').'">Dashboard</a></li>
					</ul>
					*/
				$this->output('</div><!--/.nav-collapse -->
			</div>
		</nav>');
	
	}
	
	public function body_banner() {

		if($this->template == 'tags') {
			$this->output('<div class = "blue-header tags-page hidden-xs">
					<div class="icon col-xs-3">
						<img src="'.$this->rooturl.'images/add_tags.svg">
					</div>
					<div class = "text col-xs-8">
						<h3>add tags to easily find answers</h3>
						<div class="desc">
							Description text comes here: How to add tags, how tags help, number of tags that can be added etc.
						</div>
					</div>
					<div class = "arrow col-xs-1">
						<a href="#" ><span class="glyphicon glyphicon-menu-down"></span> </a>
					</div>
				</div>');
		} else if($this->template == 'ask') {
			$this->output('<div class = "blue-header">
					ask a question
				</div>');
		} else if($this->template == 'users') {
			$this->output('<div class = "blue-header">
					users
				</div>');
		
		} else if($this->template == 'user') {
			$this->output('<div class = "blue-header">
					user details
				</div>');
		
		} else if($this->template == 'dashboard') {
			$this->output('<div class = "blue-header">
					Dashboard
				</div>');
		
		//}  else if($this->template == 'questions' || $this->template == 'activity'){
		}  else {
			if(qa_get_logged_in_userid() == null){
				$this->output('<div class = "blue-banner">
					<div class="container">
						<div class = "title">Welcome to openstack</div>
						<div class="row content">

							<div class="col-xs-3 banner-partition border">
								<img src="'.$this->rooturl.'images/add_tags.svg">
								<p class = "caption">
									ask questions and get answers
								</p>
							</div>
							<div class="col-xs-3 banner-partition border">
								<img src="'.$this->rooturl.'images//add_tags.svg">
								<p class = "caption">
									add tags to easily find answers
								</p>
							</div>
							<div class="col-xs-3 banner-partition border">
								<img src="'.$this->rooturl.'images//score_high.svg">
								<p class = "caption">
									score high when people vote
								</p>
							</div>
							<div class="col-xs-3 banner-partition">
								<div class="sub-title ">
									sign up to get started
								</div>
								<span class = "text-caps ">
									sign up helps you to:
								</span>
								<br>
								<span class = "description ">
									description text comes up
								</span>
								<br>
								<button type="button" class = "btn signup-btn" id = "signup-btn">sign up</button>
							</div>
						</div>
						
						<div class = "arrow"> <a href="#" id = "shrink-banner"><span class="glyphicon glyphicon-menu-down"></span> </a> </div>

					</div>
				</div>');
				
			} else {
				
					$this->output('<div class = "blue-banner">

						<div class="container">
							<div class = "title">Welcome to openstack</div>
							<div class="row content">

								<div class="col-xs-4 banner-partition border">
									<img src="'.$this->rooturl.'images/add_tags.svg">
									<p class = "caption">
										ask questions and get answers
									</p>
								</div>
								<div class="col-xs-4 banner-partition border">
									<img src="'.$this->rooturl.'images//add_tags.svg">
									<p class = "caption">
										add tags to easily find answers
									</p>
								</div>
								<div class="col-xs-4 banner-partition border">
									<img src="'.$this->rooturl.'images//score_high.svg">
									<p class = "caption">
										score high when people vote
									</p>
								</div>
							</div>
							
							<div class = "arrow"> <a href="#" id = "shrink-banner"><span class="glyphicon glyphicon-menu-down"></span> </a> </div>

						</div>
					</div>');
				}
		}
	}

	public function body_content()
	{
		$this->body_prefix();
		//$this->notices();
		if($this->template == 'ask') {
			$r_width = "col-sm-7";
			$l_width = "col-sm-5";
		} else if ($this->template == 'questions' || $this->template == 'question' || $this->template == 'ask' ){
			$r_width = "col-sm-9";
			$l_width = "col-sm-3";
		}else {
			$r_width = "col-sm-12";
			$l_width = "";
		}
		
		
		$this->output('<div class="container"><div class="row page-content"><div class="'.$r_width.' col-xs-12">', '');

		$this->widgets('full', 'top');
		$this->header();
		$this->widgets('full', 'high');
		
		$this->main();
		
		
		if($this->template == 'questions' || $this->template == 'question' || $this->template == 'ask') {
			$this->output('</div>', '');
			$this->output('<div class="'.$l_width.' side-bar">', '');
			$this->sidepanel();
		}
		
		
		$this->widgets('full', 'low');
		
		$this->widgets('full', 'bottom');

		$this->output('</div></div></div> <!-- END body-wrapper -->');
		
		$this->footer();

		$this->body_suffix();
	}
	
	public function header()
	{
		//$this->output('<div class="qa-header">');

		//$this->logo();
		//$this->nav_user_search();
		//$this->nav_main_sub();
		//$this->nav('sub');
		//$this->header_clear();

		//$this->output('</div> <!-- END qa-header -->', '');
	}
	
	public function nav($navtype, $level=null)
	{
		$navigation = @$this->content['navigation'][$navtype];

		//print_r($navigation);
		
		if ($navtype == 'user' || isset($navigation)) {
			//$this->output('<div class="qa-nav-'.$navtype.'">');

			
			if ($navtype == 'user')
				$this->logged_in();

			// reverse order of 'opposite' items since they float right
			foreach (array_reverse($navigation, true) as $key => $navlink) {
				if (@$navlink['opposite']) {
					unset($navigation[$key]);
					$navigation[$key] = $navlink;
				}
			}
			
			
			
			if($navtype == 'sub') {
				$this->output('<div>');
				if($this->template == 'tags'){
					$this->output('
					<ul class="nav navbar-nav navbar-right hidden-xs search-submenu">
						<li style= "margin-top:10px;">
							Type to search tags:
						</li>
						<li>
							<form class="navbar-form form-inline" role="search" style = "margin-top:0;">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search" name="filter">
									<input type="hidden" value="tags" name="qa">
									<div class="input-group-btn">
										<button class="btn btn-default search-btn" type="submit">
											<i class="glyphicon glyphicon-search">
											</i>
										</button>
									</div>
								</div>
							</form>
						</li>
					</ul>
				');
				} else if ($this->template == 'users'){
					$this->output('
						<ul class="nav navbar-nav navbar-right hidden-xs search-submenu">
										<li style= "margin-top:10px;">Type to search users:</li>
										<li>	
											<form class="navbar-form form-inline" role="search" style = "margin-top:0;">
												<div class="input-group">

													<input type="text" class="form-control" placeholder="Search" name="q">
													<input type="hidden" value="users" name="qa">
													<div class="input-group-btn">
														<button class="btn btn-default search-btn" type="submit">
															<i class="glyphicon glyphicon-search"></i>
														</button>
													</div>
												</div>
											</form>

										</li>
									</ul>
					');
				}
				$this->output('</div>');
			}
			
			$this->set_context('nav_type', $navtype);
			$this->nav_list($navigation, 'nav-'.$navtype, $level);
			$this->nav_clear($navtype);
			//$this->clear_context('nav_type');

			//$this->output('</div>');
			
		}
	}

	public function nav_list($navigation, $class, $level=null)
	{
		$this->output('<ul class="qa-'.$class.'-list'.(isset($level) ? (' qa-'.$class.'-list-'.$level) : '').'">');

		$index = 0;

		foreach ($navigation as $key => $navlink) {
			$this->set_context('nav_key', $key);
			$this->set_context('nav_index', $index++);
			$this->nav_item($key, $navlink, $class, $level);
		}

		$this->clear_context('nav_key');
		$this->clear_context('nav_index');

		$this->output('</ul>');
	}

	public function nav_clear($navtype)
	{
		$this->output(
			'<div class="qa-nav-'.$navtype.'-clear">',
			'</div>'
		);
	}

	public function nav_item($key, $navlink, $class, $level=null)
	{
		$suffix = strtr($key, array( // map special character in navigation key
			'$' => '',
			'/' => '-',
		));

		$this->output('<li class="qa-'.$class.'-item'.(@$navlink['opposite'] ? '-opp' : '').
			(@$navlink['state'] ? (' qa-'.$class.'-'.$navlink['state']) : '').' qa-'.$class.'-'.$suffix.'">');
		$this->nav_link($navlink, $class);

		if (count(@$navlink['subnav']))
			$this->nav_list($navlink['subnav'], $class, 1+$level);

		$this->output('</li>');
	}

	public function nav_link($navlink, $class)
	{
		if (isset($navlink['url'])) {
			$this->output(
				'<a href="'.$navlink['url'].'" class="qa-'.$class.'-link'.
				(@$navlink['selected'] ? (' qa-'.$class.'-selected') : '').
				(@$navlink['favorited'] ? (' qa-'.$class.'-favorited') : '').
				'"'.(strlen(@$navlink['popup']) ? (' title="'.$navlink['popup'].'"') : '').
				(isset($navlink['target']) ? (' target="'.$navlink['target'].'"') : '').'>'.$navlink['label'].
				'</a>'
			);
		}
		else {
			$this->output(
				'<span class="qa-'.$class.'-nolink'.(@$navlink['selected'] ? (' qa-'.$class.'-selected') : '').
				(@$navlink['favorited'] ? (' qa-'.$class.'-favorited') : '').'"'.
				(strlen(@$navlink['popup']) ? (' title="'.$navlink['popup'].'"') : '').
				'>'.$navlink['label'].'</span>'
			);
		}

		if (strlen(@$navlink['note']))
			$this->output('<span class="qa-'.$class.'-note">'.$navlink['note'].'</span>');
	}
	
	public function main()
	{
		$content = $this->content;

		//$this->output('<div class="qa-main'.(@$this->content['hidden'] ? ' qa-main-hidden' : '').'">');
		
		$this->widgets('main', 'top');
			
		$this->page_title_error();
		
		$this->output('<br/>');
		$this->nav('sub');

		$this->widgets('main', 'high');
	
				
		if($this->template == 'users'){		
			$this->main_parts_users($content);
			
		} else if ($this->template == 'user'){
			$this->main_parts_user($content);
	
		}else if ($this->template == 'dashboard'){
			$this->main_parts_dashboard($content);
		} else{
			
			
			$this->main_parts($content);
			
		}
		

		$this->widgets('main', 'low');

			$this->page_links();
			
			
			
			if($this->template=='tags'){
				// No suggestions required in the tags page
			} else {
				$this->suggest_next();
			}

			$this->widgets('main', 'bottom');

			//$this->output('</div> <!-- END qa-main -->', '');
		//}
	
	}
	// removes sidebar for user profile pages
	public function sidepanel()
	{
		if ($this->template =='ask') {
			$this->output('<div class="heading">how to ask?</div>
				<div class="content">
					
					<ul class = "category-list ask-page">
						<li class="border"> 
							Want to ask some relevent questions in openstack community. Description text comes here.
						</li>
						<li class="border"> 
							<div class="sub-title">help question 1?</div>
							Description text comes here.
						</li>
						<li class="border"> 
							<div class="sub-title">help question 2?</div>
							Description text comes here.
						</li>
						<li class="border" > 
							<div class="sub-title">help question 3?</div>
							Description text comes here.
						</li>
						<li> 
							<div class="sub-title">help question 4?</div>
							Description text comes here.
						</li>
					</ul>
				</div>
				<div class="content border">
					<p>
						Let us know if you have suggestions on other community mailing lists that should be made seachable here.
					</p>
					<p>
						For the corporate mailings lists, visit <a href="nimeyo.com">nimeyo.com</a> or send a note <a href="#">here</a>.
					</p>
				</div>');
		
		} else {
		//echo 'test';
		//echo '<pre>';print_r($this);
			if ($this->template!='user')
				qa_html_theme_base::sidepanel();
		}
		
		//$this->listCat();
	}

	// prevent display of regular footer content (see body_suffix()) and replace with closing new <div>s
	public function footer()
	{
		
		$this->output('</div> <!-- END main-shadow -->');
		$this->output('<footer class="footer">
			<div class="container">
				<span class="pull-left">feedback | contact us</span>
				<span class="pull-right">Copyright @ 2016 nimeyo all rights reserved</span>
			</div>
		</footer>');
		
		
	}

	// add RSS feed icon after the page title
	public function title()
	{
		if(isset($_SERVER['QUERY_STRING'][3]) && is_numeric($_SERVER['QUERY_STRING'][3] ) == 1){ 
		}else{
		qa_html_theme_base::title();
		}

		$feed=@$this->content['feed'];

		if (!empty($feed))
			$this->output('<a href="'.$feed['url'].'" title="'.@$feed['label'].'"><img src="'.$this->rooturl.'images/rss.jpg" alt="" width="16" height="16" border="0" class="qa-rss-icon"/></a>');
	}
	
	
	public function main_part($key, $part)
	{
		$partdiv = (
			strpos($key, 'custom') === 0 ||
			strpos($key, 'form') === 0 ||
			strpos($key, 'q_list') === 0 ||
			(strpos($key, 'q_view') === 0 && !isset($this->content['form_q_edit'])) ||
			strpos($key, 'a_form') === 0 ||
			strpos($key, 'a_list') === 0 ||
			strpos($key, 'ranking') === 0 ||
			strpos($key, 'message_list') === 0 ||
			strpos($key, 'nav_list') === 0
		);

		if ($partdiv)
			$this->output('<div class="qa-part-'.strtr($key, '_', '-').'">'); // to help target CSS to page parts

		if (strpos($key, 'custom') === 0)
			$this->output_raw($part);

		elseif (strpos($key, 'form') === 0)
			$this->form($part);

		elseif (strpos($key, 'q_list') === 0)
			$this->q_list_and_form($part);

		elseif (strpos($key, 'q_view') === 0)
			$this->q_view($part);

		elseif (strpos($key, 'a_form') === 0)
			$this->a_form($part);

		elseif (strpos($key, 'a_list') === 0)
			$this->a_list($part);

		elseif (strpos($key, 'ranking') === 0)
			$this->ranking($part);

		elseif (strpos($key, 'message_list') === 0)
			$this->message_list_and_form($part);

		elseif (strpos($key, 'nav_list') === 0) {
			$this->part_title($part);
			$this->nav_list($part['nav'], $part['type'], 1);
		}

		if ($partdiv)
			$this->output('</div>');
	}


	// add view count to question list
	public function q_item_stats($q_item)
	{
		$this->output('<div class="qa-q-item-stats">');

		$this->voting($q_item);
		$this->a_count($q_item);
		qa_html_theme_base::view_count($q_item);

		$this->output('</div>');
	}

	// prevent display of view count in the usual place
	public function view_count($q_item)
	{
		if ($this->template=='question')
			qa_html_theme_base::view_count($q_item);
	}

	// to replace standard Q2A footer
	public function body_suffix()
	{/*
		$this->output('<div class="qa-footer-bottom-group">');
		qa_html_theme_base::footer();
		$this->output('</div> <!-- END footer-bottom-group -->', '');*/
	}
	
	
	public function form($form)
	{
		
		if (!empty($form)) {
			$this->part_title($form);

			if (isset($form['tags']))
				$this->output('<form '.$form['tags'].'>');

			$this->form_body($form);

			if (isset($form['tags']))
				$this->output('</form>');
		}
	}

	public function form_columns($form)
	{
		if (isset($form['ok']) || !empty($form['fields']) )
			$columns = ($form['style'] == 'wide') ? 3 : 1;
		else
			$columns = 0;

		return $columns;
	}

	public function form_spacer($form, $columns)
	{
		$this->output(
			'<tr>',
			'<td colspan="'.$columns.'" class="qa-form-'.$form['style'].'-spacer">',
			'&nbsp;',
			'</td>',
			'</tr>'
		);
	}

	public function form_body($form)
	{
		if (@$form['boxed'])
			$this->output('<div class="qa-form-table-boxed">');

		$columns = $this->form_columns($form);

		if ($columns)
			$this->output('<table class="qa-form-'.$form['style'].'-table">');

		$this->form_ok($form, $columns);
		$this->form_fields($form, $columns);
		$this->form_buttons($form, $columns);

		if ($columns)
			$this->output('</table>');

		$this->form_hidden($form);

		if (@$form['boxed'])
			$this->output('</div>');
	}

	public function form_ok($form, $columns)
	{
		if (!empty($form['ok'])) {
			$this->output(
				'<tr>',
				'<td colspan="'.$columns.'" class="qa-form-'.$form['style'].'-ok">',
				$form['ok'],
				'</td>',
				'</tr>'
			);
		}
	}

	public function form_reorder_fields(&$form, $keys, $beforekey=null, $reorderrelative=true)
/*
	Reorder the fields of $form according to the $keys array which contains the field keys in their new order. Call
	before any fields are output. See the docs for qa_array_reorder() in util/sort.php for the other parameters.
*/
	{
		require_once QA_INCLUDE_DIR.'util/sort.php';

		if (is_array($form['fields']))
			qa_array_reorder($form['fields'], $keys, $beforekey, $reorderrelative);
	}

	public function form_fields($form, $columns)
	{
		if (!empty($form['fields'])) {
			foreach ($form['fields'] as $key => $field) {
				$this->set_context('field_key', $key);

				if (@$field['type'] == 'blank')
					$this->form_spacer($form, $columns);
				else
					$this->form_field_rows($form, $columns, $field);
			}

			$this->clear_context('field_key');
		}
	}

	public function form_field_rows($form, $columns, $field)
	{
		$style = $form['style'];

		if (isset($field['style'])) { // field has different style to most of form
			$style = $field['style'];
			$colspan = $columns;
			$columns = ($style == 'wide') ? 3 : 1;
		}
		else
			$colspan = null;

		
		$prefixed = (@$field['type'] == 'checkbox') && ($columns == 1) && !empty($field['label']);
		$suffixed = (@$field['type'] == 'select' || @$field['type'] == 'number') && $columns == 1 && !empty($field['label']) && !@$field['loose'];
		$skipdata = @$field['tight'];
		$tworows = ($columns == 1) && (!empty($field['label'])) && (!$skipdata) &&
			( (!($prefixed||$suffixed)) || (!empty($field['error'])) || (!empty($field['note'])) );

		if (isset($field['id'])) {
			if ($columns == 1)
				$this->output('<tbody id="'.$field['id'].'">', '<tr>');
			else
				$this->output('<tr id="'.$field['id'].'">');
		}
		else
			$this->output('<tr>');

		if ($columns > 1 || !empty($field['label']))
			$this->form_label($field, $style, $columns, $prefixed, $suffixed, $colspan);

		if ($tworows) {
			$this->output(
				'</tr>',
				'<tr>'
			);
		}

		if (!$skipdata) {
			$this->form_data($field, $style, $columns, !($prefixed||$suffixed), $colspan);
		}
			

		$this->output('</tr>');

		if ($columns == 1 && isset($field['id']))
			$this->output('</tbody>');
	}

	public function form_label($field, $style, $columns, $prefixed, $suffixed, $colspan)
	{
		$extratags = '';

		if ($columns > 1 && (@$field['type'] == 'select-radio' || @$field['rows'] > 1))
			$extratags .= ' style="vertical-align:top;"';

		if (isset($colspan))
			$extratags .= ' colspan="'.$colspan.'"';

		$this->output('<td class="qa-form-'.$style.'-label"'.$extratags.'>');
		

		if ($prefixed) {			
			$string = explode(' ', $field['tags'], 1);			
			$name = explode('"',$string[0],3);
			$field['tags'] = $field['tags'].' '.str_replace('name','id', $field['tags']);
			$this->form_field($field, $style);	
			
			$this->output('<label for="'.$name[1].'"><span><span></span></span>');	
		}

		 $this->output(@$field['label']);

		if ($prefixed)
			$this->output('</label>');

		if ($suffixed) {
			$this->output('&nbsp;');
			$this->form_field($field, $style);
			//$this->output('<label for="'.$name[1].'"><span><span></span></span></label>');
			
		}

		$this->output('</td>');
	}

	public function form_data($field, $style, $columns, $showfield, $colspan)
	{
		if ($showfield || (!empty($field['error'])) || (!empty($field['note']))) {
			$this->output(
				'<td class="qa-form-'.$style.'-data"'.(isset($colspan) ? (' colspan="'.$colspan.'"') : '').'>'
			);

			if ($showfield)
				$this->form_field($field, $style, 0);

			if (!empty($field['error'])) {
				if (@$field['note_force'])
					$this->form_note($field, $style, $columns);

				$this->form_error($field, $style, $columns);
			}
			elseif (!empty($field['note']))
				$this->form_note($field, $style, $columns);

			$this->output('</td>');
		}
	}

	public function form_field($field, $style, $label=1)
	{
		$this->form_prefix($field, $style);

		$this->output_raw(@$field['html_prefix']);

		switch (@$field['type']) {
			case 'checkbox':
				$this->form_checkbox_nimeyo($field, $style,$label);
				break;

			case 'static':
				$this->form_static($field, $style);
				break;

			case 'password':
				$this->form_password($field, $style);
				break;

			case 'number':
				$this->form_number($field, $style);
				break;

			case 'select':
				$this->form_select($field, $style);
				break;

			case 'select-radio':
				$this->form_select_radio_nimeyo($field, $style,$label);
				break;

			case 'image':
				$this->form_image($field, $style);
				break;

			case 'custom':
				$this->output_raw(@$field['html']);
				break;

			default:
				if (@$field['type'] == 'textarea' || @$field['rows'] > 1)
					$this->form_text_multi_row($field, $style);
				else
					$this->form_text_single_row($field, $style);
				break;
		}

		$this->output_raw(@$field['html_suffix']);

		$this->form_suffix($field, $style);
	}

	public function form_reorder_buttons(&$form, $keys, $beforekey=null, $reorderrelative=true)
/*
	Reorder the buttons of $form according to the $keys array which contains the button keys in their new order. Call
	before any buttons are output. See the docs for qa_array_reorder() in util/sort.php for the other parameters.
*/
	{
		require_once QA_INCLUDE_DIR.'util/sort.php';

		if (is_array($form['buttons']))
			qa_array_reorder($form['buttons'], $keys, $beforekey, $reorderrelative);
	}

	public function form_buttons($form, $columns)
	{
		if (!empty($form['buttons'])) {
			$style = @$form['style'];

			if ($columns) {
				$this->output(
					'<tr>',
					'<td colspan="'.$columns.'" class="qa-form-'.$style.'-buttons">'
				);
			}

			foreach ($form['buttons'] as $key => $button) {
				$this->set_context('button_key', $key);

				if (empty($button))
					$this->form_button_spacer($style);
				else {
					$this->form_button_data($button, $key, $style);
					$this->form_button_note($button, $style);
				}
			}

			$this->clear_context('button_key');

			if ($columns) {
				$this->output(
					'</td>',
					'</tr>'
				);
			}
		}
	}

	public function form_button_data($button, $key, $style)
	{
		$baseclass = 'qa-form-'.$style.'-button qa-form-'.$style.'-button-'.$key;

		$this->output('<input'.rtrim(' '.@$button['tags']).' value="'.@$button['label'].'" title="'.@$button['popup'].'" type="submit"'.
			(isset($style) ? (' class="'.$baseclass.'"') : '').'/>');
	}

	public function form_button_note($button, $style)
	{
		if (!empty($button['note'])) {
			$this->output(
				'<span class="qa-form-'.$style.'-note">',
				$button['note'],
				'</span>',
				'<br/>'
			);
		}
	}

	public function form_button_spacer($style)
	{
		$this->output('<span class="qa-form-'.$style.'-buttons-spacer">&nbsp;</span>');
	}

	public function form_hidden($form)
	{
		$this->form_hidden_elements(@$form['hidden']);
	}

	public function form_hidden_elements($hidden)
	{
		if (!empty($hidden)) {
			foreach ($hidden as $name => $value)
				$this->output('<input type="hidden" name="'.$name.'" value="'.$value.'"/>');
		}
	}

	public function form_prefix($field, $style)
	{
		if (!empty($field['prefix']))
			$this->output('<span class="qa-form-'.$style.'-prefix">'.$field['prefix'].'</span>');
	}

	public function form_suffix($field, $style)
	{
		if (!empty($field['suffix']))
			$this->output('<span class="qa-form-'.$style.'-suffix">'.$field['suffix'].'</span>');
	}

	public function form_checkbox_nimeyo($field, $style, $label )
	{
		$string = explode(' ', $field['tags'], 1);			
		$name = explode('"',$string[0],3);
		$field['tags'] = $field['tags'].' '.str_replace('name','id', $field['tags']);
		
		$this->output('<input '.@$field['tags'].' type="checkbox" value="1"'.(@$field['value'] ? ' checked' : '').' class="qa-form-'.$style.'-checkbox"/>');
		if(!$label) {
			$this->output('<label for="'.$name[1].'"><span><span></span></span></label>');
		}
	}

	public function form_static($field, $style)
	{
		$this->output('<span class="qa-form-'.$style.'-static">'.@$field['value'].'</span>');
	}

	public function form_password($field, $style)
	{
		$this->output('<input '.@$field['tags'].' type="password" value="'.@$field['value'].'" class="qa-form-'.$style.'-text"/>');
	}

	public function form_number($field, $style)
	{
		$this->output('<input '.@$field['tags'].' type="text" value="'.@$field['value'].'" class="qa-form-'.$style.'-number"/>');
	}

	/**
	 * Output a <select> element. The $field array may contain the following keys:
	 *   options: (required) a key-value array containing all the options in the select.
	 *   tags: any attributes to be added to the select.
	 *   value: the selected value from the 'options' parameter.
	 *   match_by: whether to match the 'value' (default) or 'key' of each option to determine if it is to be selected.
	 */
	public function form_select($field, $style)
	{
		$this->output('<select ' . (isset($field['tags']) ? $field['tags'] : '') . ' class="qa-form1-' . $style . '-select">');

		// Only match by key if it is explicitly specified. Otherwise, for backwards compatibility, match by value
		$matchbykey = isset($field['match_by']) && $field['match_by'] === 'key';

		foreach ($field['options'] as $key => $value) {
			$selected = isset($field['value']) && (
				($matchbykey && $key === $field['value']) ||
				(!$matchbykey && $value === $field['value'])
			);
			$this->output('<option value="' . $key . '"' . ($selected ? ' selected' : '') . '>' . $value . '</option>');
		}

		$this->output('</select>');
	}

	public function form_select_radio($field, $style)
	{
		$radios = 0;

		foreach ($field['options'] as $tag => $value) {
			if ($radios++)
				$this->output('<br/>');

			$this->output('<input '.@$field['tags'].' type="radio" value="'.$tag.'"'.(($value == @$field['value']) ? ' checked' : '').' class="qa-form-'.$style.'-radio"/> '.$value);
		}
	}
	
	public function form_select_radio_nimeyo($field, $style, $label)
	{
		$string = explode(' ', $field['tags'], 1);			
		$name = explode('"',$string[0],3);

		
		$radios = 0;

		foreach ($field['options'] as $tag => $value) {
			$field_tags = $field['tags'];
			if ($radios++)
				$this->output('<br/>');
			
			$field_tags = $field_tags.' id="'.$name[1].$radios.'"';
			$this->output('<input '.@$field_tags.' type="radio" value="'.$tag.'"'.(($value == @$field['value']) ? ' checked' : '').' class="qa-form-'.$style.'-radio"/>');
			
			if(!$label) {
				//print_r($name);
				$this->output('<label for="'.$name[1].$radios.'"><span><span></span></span>'.$value.'</label>');
			}
		}
	}


	public function form_image($field, $style)
	{
		$this->output('<div class="qa-form-'.$style.'-image">'.@$field['html'].'</div>');
	}

	public function form_text_single_row($field, $style)
	{
		$this->output('<input '.@$field['tags'].' type="text" value="'.@$field['value'].'" class="qa-form-'.$style.'-text"/>');
	}

	public function form_text_multi_row($field, $style)
	{
		$this->output('<textarea '.@$field['tags'].' rows="'.(int)$field['rows'].'" cols="40" class="qa-form-'.$style.'-text">'.@$field['value'].'</textarea>');
	}

	public function form_error($field, $style, $columns)
	{
		$tag = ($columns > 1) ? 'span' : 'div';

		$this->output('<'.$tag.' class="qa-form-'.$style.'-error">'.$field['error'].'</'.$tag.'>');
	}

	public function form_note($field, $style, $columns)
	{
		$tag = ($columns > 1) ? 'span' : 'div';

		$this->output('<'.$tag.' class="qa-form-'.$style.'-note">'.@$field['note'].'</'.$tag.'>');
	}

	public function ranking($ranking)
	{
		$this->part_title($ranking);

		if (!isset($ranking['type']))
			$ranking['type'] = 'items';
		$class = 'qa-top-'.$ranking['type'];

		if (!$this->ranking_block_layout) {
			// old, less semantic table layout
			$this->ranking_table($ranking, $class);
		}
		else {
			// new block layout
			foreach ($ranking['items'] as $item) {
				$this->output('<span class="qa-ranking-item '.$class.'-item">');
				$this->ranking_item($item, $class);
				$this->output('</span>');
			}
		}

		$this->part_footer($ranking);
	}

	public function ranking_item($item, $class, $spacer=false) // $spacer is deprecated
	{
		if (!$this->ranking_block_layout) {
			// old table layout
			$this->ranking_table_item($item, $class, $spacer);
			return;
		}

		if (isset($item['count']))
			$this->ranking_count($item, $class);

		if (isset($item['avatar']))
			$this->avatar($item, $class);

		$this->ranking_label($item, $class);

		if (isset($item['score']))
			$this->ranking_score($item, $class);
	}

	public function ranking_cell($content, $class)
	{
		$tag = $this->ranking_block_layout ? 'span': 'td';
		$this->output('<'.$tag.' class="'.$class.'">' . $content . '</'.$tag.'>');
	}

	public function ranking_count($item, $class)
	{
		$this->ranking_cell($item['count'].' &#215;', $class.'-count');
	}

	public function ranking_label($item, $class)
	{
		$this->ranking_cell($item['label'], $class.'-label');
	}

	public function ranking_score($item, $class)
	{
		$this->ranking_cell($item['score'], $class.'-score');
	}

	/**
	 * @deprecated Table-based layout of users/tags is deprecated from 1.7 onwards and may be
	 * removed in a future version. Themes can switch to the new layout by setting the member
	 * variable $ranking_block_layout to false.
	 */
	public function ranking_table($ranking, $class)
	{
		$rows = min($ranking['rows'], count($ranking['items']));

		if ($rows > 0) {
			$this->output('<table class="'.$class.'-table">');
			$columns = ceil(count($ranking['items']) / $rows);

			for ($row = 0; $row < $rows; $row++) {
				$this->set_context('ranking_row', $row);
				$this->output('<tr>');

				for ($column = 0; $column < $columns; $column++) {
					$this->set_context('ranking_column', $column);
					$this->ranking_table_item(@$ranking['items'][$column*$rows+$row], $class, $column>0);
				}

				$this->clear_context('ranking_column');
				$this->output('</tr>');
			}
			$this->clear_context('ranking_row');
			$this->output('</table>');
		}
	}

	/**
	 * @deprecated See ranking_table above.
	 */
	public function ranking_table_item($item, $class, $spacer)
	{
		if ($spacer)
			$this->ranking_spacer($class);

		if (empty($item)) {
			$this->ranking_spacer($class);
			$this->ranking_spacer($class);

		} else {
			if (isset($item['count']))
				$this->ranking_count($item, $class);

			if (isset($item['avatar']))
				$item['label'] = $item['avatar'].' '.$item['label'];

			$this->ranking_label($item, $class);

			if (isset($item['score']))
				$this->ranking_score($item, $class);
		}
	}

	/**
	 * @deprecated See ranking_table above.
	 */
	public function ranking_spacer($class)
	{
		$this->output('<td class="'.$class.'-spacer">&nbsp;</td>');
	}


	public function message_list_and_form($list)
	{
		if (!empty($list)) {
			$this->part_title($list);

			$this->error(@$list['error']);

			if (!empty($list['form'])) {
				$this->output('<form '.$list['form']['tags'].'>');
				unset($list['form']['tags']); // we already output the tags before the messages
				$this->message_list_form($list);
			}

			$this->message_list($list);

			if (!empty($list['form'])) {
				$this->output('</form>');
			}
		}
	}

	public function message_list_form($list)
	{
		if (!empty($list['form'])) {
			$this->output('<div class="qa-message-list-form">');
			$this->form($list['form']);
			$this->output('</div>');
		}
	}

	public function message_list($list)
	{
		if (isset($list['messages'])) {
			$this->output('<div class="qa-message-list" '.@$list['tags'].'>');

			foreach ($list['messages'] as $message)
				$this->message_item($message);

			$this->output('</div> <!-- END qa-message-list -->', '');
		}
	}

	public function message_item($message)
	{
		$this->output('<div class="qa-message-item" '.@$message['tags'].'>');
		$this->message_content($message);
		$this->post_avatar_meta($message, 'qa-message');
		$this->message_buttons($message);
		$this->output('</div> <!-- END qa-message-item -->', '');
	}

	public function message_content($message)
	{
		if (!empty($message['content'])) {
			$this->output('<div class="qa-message-content">');
			$this->output_raw($message['content']);
			$this->output('</div>');
		}
	}

	public function message_buttons($item)
	{
		if (!empty($item['form'])) {
			$this->output('<div class="qa-message-buttons">');
			$this->form($item['form']);
			$this->output('</div>');
		}
	}

	public function list_vote_disabled($items)
	{
		$disabled = false;

		if (count($items)) {
			$disabled = true;

			foreach ($items as $item) {
				if (@$item['vote_on_page'] != 'disabled')
					$disabled = false;
			}
		}

		return $disabled;
	}

	public function q_list_and_form($q_list)
	{
		
		if (empty($q_list))
			return;

		$this->part_title($q_list);

		if (!empty($q_list['form'])) {
			$q_list['form']['hidden']['code_vote'] = $q_list['form']['hidden']['code'];
			unset($q_list['form']['hidden']['code']);
			$this->output('<form '.$q_list['form']['tags'].'>');
		}
			

		$this->q_list($q_list);

		if (!empty($q_list['form'])) {
			unset($q_list['form']['tags']); // we already output the tags before the qs
			$this->q_list_form($q_list);
			$this->output('</form>');
		}

		$this->part_footer($q_list);
	}

	public function q_list_form($q_list)
	{
		
		if (!empty($q_list['form'])) {
			//$this->output('<div class="qa-q-list-form">');
			$this->form($q_list['form']);
			//$this->output('</div>');
		}
	}

	public function q_list($q_list)
	{
		if (isset($q_list['qs'])) {
			//$this->output('<div class="qa-q-list'.($this->list_vote_disabled($q_list['qs']) ? ' qa-q-list-vote-disabled' : '').'">', '');
			$this->q_list_items($q_list['qs']);
			//$this->output('</div> <!-- END qa-q-list -->', '');
		}
	}

	public function q_list_items($q_items)
	{
		foreach ($q_items as $q_item)
			$this->q_list_item($q_item);
	}

	public function q_list_item($q_item)
	{
		//print_r($q_item);
		//$this->output('<div class="qa-q-list-item'.rtrim(' '.@$q_item['classes']).'" '.@$q_item['tags'].'>');
/*
		$this->output('<div class="post" >');
		
		$this->q_item_main($q_item);
		$this->q_item_stats($q_item);
		$this->q_item_clear();

		$this->output('</div> <!-- END qa-q-list-item -->', '');
		
		/*
		$this->output('<div class="qa-q-item-stats">');

		$this->voting($q_item);
		$this->a_count($q_item);
		qa_html_theme_base::view_count($q_item);

		$this->output('</div>');
		
		$this->output(
			'<div class="qa-q-item-title">',
			'<a href="'.$q_item['url'].'">'.$q_item['title'].'</a>',
			// add closed note in title
			empty($q_item['closed']['state']) ? '' : ' ['.$q_item['closed']['state'].']',
			'</div>'
		);
		**/
		
		$this->output('<div class="post" >');
		
$this->output(
			'<div class="post-title">',
			'<a href="'.$q_item['url'].'">'.$q_item['title'].'</a>',
			// add closed note in title
			empty($q_item['closed']['state']) ? '' : ' ['.$q_item['closed']['state'].']',
			'</div>'
		);
if (!empty($q_item['content'])) {
			$this->output('<div class = "details">');
			//print_r($q_item);
			$this->output('</div>');
		}
		

if ($this->template=='question')
			qa_html_theme_base::view_count($q_item);


$this->post_avatar_meta($q_item, 'qa-q-item');

if (!empty($q_item['q_tags'])) {
			$this->output('<div class = "tags">');
				$this->output('<ul>');
//print_r($q_item);
					foreach ($q_item['q_tags'] as $taghtml)
						//$this->post_tag_item($taghtml, $class);
						$this->output('<li>'.$taghtml.'</li>');

				$this->output('</ul>');
			
			//$this->post_tag_list($post, $class);
			$this->output('</div>');
		}
		
if (!empty($q_item['form'])) {
			$this->output('<div class="qa-q-item-buttons">');
			$this->form($q_item['form']);
			$this->output('</div>');
		}
		
		
$this->output('<div class = "votes">');
$this->output('<ul '.@$q_item['vote_tags'].'>');

$this->voting($q_item);
$this->responses_views($q_item);
		/*//$this->voting($q_item);
		//if (isset($post['vote_view'])) {
			$this->output('<li class = "vote border">');
				if (isset($q_item['vote_view'])) {
	//$this->output('<div class="qa-voting '.(($post['vote_view'] == 'updown') ? 'qa-voting-updown' : 'qa-voting-net').'" '.@$post['vote_tags'].'>');
	//$this->output('<div class = "vote border">');
/*
		switch (@$post['vote_state'])
		{
			case 'voted_up':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-voted-up');
				break;

			case 'voted_up_disabled':
				$this->post_disabled_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-vote-up');
				break;

			case 'voted_down':
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-voted-down');
				break;

			case 'voted_down_disabled':
				$this->post_disabled_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-vote-down');
				break;

			case 'up_only':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-first-button qa-vote-up');
				$this->post_disabled_button($post, 'vote_down_tags', '', 'qa-vote-second-button qa-vote-down');
				break;

			case 'enabled':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-first-button qa-vote-up');
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-second-button qa-vote-down');
				break;

			default:
				$this->post_disabled_button($post, 'vote_up_tags', '', 'qa-vote-first-button qa-vote-up');
				$this->post_disabled_button($post, 'vote_down_tags', '', 'qa-vote-second-button qa-vote-down');
				break;
		}

		//$this->output('</div>');
		$this->output('<input '.$q_item['vote_up_tags'].$q_item['vote_tags'].' type="submit" value="+" class="qa-vote-up-button"/> ');
		//$this->output('<input title="Click to vote up" name="vote_4_1_q4" onclick="return qa_vote_click(this);" type="submit" value="+" class="qa-vote-first-button qa-vote-up-button">');
		//$this->output('<img src = "'.$this->rooturl.'images/upvote.svg">');
		$this->output('<span class = "vote-count up">');

		echo $q_item['upvotes_view']['data'];
			

		$this->output('</span></li>');
		$this->output('<li class = "vote border">');
		//$this->output('<img src = "'.$this->rooturl.'images/downvote.svg">');
		$this->output('<input '.$q_item['vote_down_tags'].$q_item['vote_tags'].' type="submit" value="-" class="qa-vote-down-button"/> ');
		$this->output('<span class = "vote-count down">');
		echo $q_item['downvotes_view']['data'];
		$this->output('</span></li>');
		
		*/
		
		/*$this->output(
			'<div class="qa-vote-clear">',
			'</div>'
		);*/
		
	//$this->output('</div>');
	//}

			//$this->output('</li>');
			
			/*$this->output('<div class = "vote border"> '.(($post['vote_view'] == 'updown') ? 'qa-voting-updown' : 'qa-voting-net').'" '.@$post['vote_tags'].'>');
			$this->voting_inner_html($post);
			$this->output('</div>');*/
			
		//}
		/*$this->output('<li class = "stats border"><p>Responses -<span class = "count">');
		// $this->a_count($q_item);
		 echo $q_item['answers_raw'];
		$this->output('</span></p></li>');
		
		$this->output('<li class = "stats"><p>Views -<span class = "count">');
		
		echo $q_item['raw']['views'];
		
		//echo '<pre>';print_r($q_item);
			//qa_html_theme_base::view_count($q_item);
		$this->output('</span></p></li></ul>');
*/
		$this->output('</ul></div>');
		
/*$this->output(
			'<div class="qa-q-item-clear">',
			'</div>'
		);*/
		$this->output('</div >');

		
	
	}

	

	public function q_item_main($q_item)
	{
		//$this->output('<div class="qa-q-item-main">');

		
		$this->q_item_title($q_item);
		$this->q_item_content($q_item);

		$this->view_count($q_item);
		$this->post_avatar_meta($q_item, 'qa-q-item');
		$this->post_tags($q_item, 'qa-q-item');
		$this->q_item_buttons($q_item);

		//$this->output('</div>');
	}

	public function q_item_clear()
	{
		$this->output(
			'<div class="qa-q-item-clear">',
			'</div>'
		);
	}

	public function q_item_title($q_item)
	{
		$this->output(
			'<div class="qa-q-item-title">',
			'<a href="'.$q_item['url'].'">'.$q_item['title'].'</a>',
			// add closed note in title
			empty($q_item['closed']['state']) ? '' : ' ['.$q_item['closed']['state'].']',
			'</div>'
		);
	}

	public function q_item_content($q_item)
	{
		if (!empty($q_item['content'])) {
			$this->output('<div class="qa-q-item-content">');
			$this->output_raw($q_item['content']);
			$this->output('</div>');
		}
	}

	public function q_item_buttons($q_item)
	{
		if (!empty($q_item['form'])) {
			$this->output('<div class="qa-q-item-buttons">');
			$this->form($q_item['form']);
			$this->output('</div>');
		}
	}

	public function voting($post)
	{
		if (isset($post['vote_view'])) {
			//$this->output('<div class = "votes">
				//	<ul>');
			//$this->output('<div class="qa-voting '.(($post['vote_view'] == 'updown') ? 'qa-voting-updown' : 'qa-voting-net').'" '.@$post['vote_tags'].'>');
			$this->voting_inner_html($post);
			//$this->output('</div>');
			
			/*$this->output('<div class = "vote border"> '.(($post['vote_view'] == 'updown') ? 'qa-voting-updown' : 'qa-voting-net').'" '.@$post['vote_tags'].'>');
			$this->voting_inner_html($post);
			$this->output('</div>');*/
			//$this->output('</ul></div>');
			
		}
	}

	public function voting_inner_html($post)
	{ 
		$this->vote_buttons($post);
		
		//$this->vote_count($post);
		//$this->vote_clear();
	}

	public function vote_buttons($post)
	{
		//print_r($post);
		$this->output('<li class = "vote border">');
		$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-first-button qa-vote-up');
		$this->output('<span class = "vote-count down">');
				echo $post['upvotes_view']['data'];
				$this->output('</span>');
				$this->output('</li >
						<li class = "vote border">');
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-second-button qa-vote-down');
				$this->output('<span class = "vote-count down">');
				echo $post['downvotes_view']['data'];
				$this->output('</span></li>');
		
		//echo '<pre>';print_r($q_item);
			//qa_html_theme_base::view_count($q_item);
		
/*
		switch (@$post['vote_state'])
		{
			case 'voted_up':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-voted-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_disabled_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-vote-down');
				echo $post['downvotes_view']['data'];
				break;

			case 'voted_up_disabled':
				$this->post_disabled_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-vote-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-voted-down');
				echo $post['downvotes_view']['data'];
				break;

			case 'voted_down':
				$this->post_disabled_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-vote-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-voted-down');
				echo $post['downvotes_view']['data'];
				break;

			case 'voted_down_disabled':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-one-button qa-voted-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_disabled_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-one-button qa-vote-down');
				echo $post['downvotes_view']['data'];
				break;

			case 'up_only':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-first-button qa-vote-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_disabled_button($post, 'vote_down_tags', '', 'qa-vote-second-button qa-vote-down');
				echo $post['downvotes_view']['data'];
				break;

			case 'enabled':
				$this->post_hover_button($post, 'vote_up_tags', '+', 'qa-vote-first-button qa-vote-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_hover_button($post, 'vote_down_tags', '&ndash;', 'qa-vote-second-button qa-vote-down');
				echo $post['downvotes_view']['data'];
				break;

			default:
				$this->post_disabled_button($post, 'vote_up_tags', '', 'qa-vote-first-button qa-vote-up');
				echo $post['upvotes_view']['data'];
				$this->output('</li >
						<li class = "vote border">');
				$this->post_disabled_button($post, 'vote_down_tags', '', 'qa-vote-second-button qa-vote-down');
				echo $post['downvotes_view']['data'];
				break;
		}
*/
		
	}
	function responses_views($q_item) {
	//echo '<pre>';print_r($q_item);
		$this->output('<li class = "stats border"><p>Responses -<span class = "count">');
		 echo $q_item['answers_raw'];
		
		$this->output('</span></p></li>');
		
		$this->output('<li class = "stats"><p>Views -<span class = "count">');
		
		echo $q_item['raw']['views'];
		$this->output('</span></p>');
		$this->output('</li>');
	}
	
/*
	public function post_hover_button($post, $element, $value, $class)
	{
		if (isset($post[$element]))
			$this->output('<input '.$post[$element].' type="submit" value="'.$value.'" class="'.$class.'-button"/> ');
	}

	public function post_disabled_button($post, $element, $value, $class)
	{
		if (isset($post[$element]))
			$this->output('<input '.$post[$element].' type="submit" value="'.$value.'" class="'.$class.'-disabled" disabled="disabled"/> ');
	}*/
	public function vote_count($post)
	{
		// You can also use $post['upvotes_raw'], $post['downvotes_raw'], $post['netvotes_raw'] to get
		// raw integer vote counts, for graphing or showing in other non-textual ways

		/*$this->output('<div class="qa-vote-count '.(($post['vote_view'] == 'updown') ? 'qa-vote-count-updown' : 'qa-vote-count-net').'"'.@$post['vote_count_tags'].'>');

		if ($post['vote_view'] == 'updown') {
			$this->output_split($post['upvotes_view'], 'qa-upvote-count');
			$this->output_split($post['downvotes_view'], 'qa-downvote-count');

		}
		else
			$this->output_split($post['netvotes_view'], 'qa-netvote-count');

		$this->output('</div>');*/
		
	//	$this->output('<div class="qa-vote-count '.(($post['vote_view'] == 'updown') ? 'qa-vote-count-updown' : 'qa-vote-count-net').'"'.@$post['vote_count_tags'].'>');

		if ($post['vote_view'] == 'updown') {
			$this->output_split($post['upvotes_view'], 'qa-upvote-count');
			$this->output_split($post['downvotes_view'], 'qa-downvote-count');

		}
		else
			$this->output_split($post['netvotes_view'], 'qa-netvote-count');

	//	$this->output('</div>')
		
	}

	public function vote_clear()
	{
		/*$this->output(
			'<div class="qa-vote-clear">',
			'</div>'
		);*/
	}

	public function a_count($post)
	{
		// You can also use $post['answers_raw'] to get a raw integer count of answers

		/*$this->output_split(@$post['answers'], 'qa-a-count', 'span', 'span',
			@$post['answer_selected'] ? 'qa-a-count-selected' : (@$post['answers_raw'] ? null : 'qa-a-count-zero'));
			*/
			$this->output_split(@$post['answers'], 'count', 'span', 'span',
			@$post['answer_selected'] ? 'qa-a-count-selected' : (@$post['answers_raw'] ? null : 'qa-a-count-zero'));
	}

	
	public function avatar($item, $class, $prefix=null)
	{
		if (isset($item['avatar'])) {
			if (isset($prefix))
				$this->output($prefix);

			$this->output(
				'<span class="'.$class.'-avatar">',
				$item['avatar'],
				'</span>'
			);
		}
	}

	public function a_selection($post)
	{
		$this->output('<li>');

		if (isset($post['select_tags']))
			$this->post_hover_button($post, 'select_tags', '', 'qa-a-select');
		elseif (isset($post['unselect_tags']))
			$this->post_hover_button($post, 'unselect_tags', '', 'qa-a-unselect');
		elseif ($post['selected'])
			$this->output('<div class="qa-a-selected">&nbsp;</div>');

		if (isset($post['select_text']))
			$this->output('<div class="qa-a-selected-text">'.@$post['select_text'].'</div>');

		$this->output('</li>');
	}

	public function post_hover_button($post, $element, $value, $class)
	{
		if (isset($post[$element]))
			$this->output('<input '.$post[$element].' type="submit" value="'.$value.'" class="'.$class.'-button"/> ');
	}

	public function post_disabled_button($post, $element, $value, $class)
	{
		if (isset($post[$element]))
			$this->output('<input '.$post[$element].' type="submit" value="'.$value.'" class="'.$class.'-disabled" disabled="disabled"/> ');
	}

	public function post_avatar_meta($post, $class, $avatarprefix=null, $metaprefix=null, $metaseparator='<br/>')
	{
		$this->output('<div class="details">');
		$this->avatar($post, $class, $avatarprefix);
		$this->post_meta($post, $class, $metaprefix, $metaseparator);
		$this->output('</div>');
	}

	/**
	 * @deprecated Deprecated from 1.7; please use avatar() instead.
	 */
	public function post_avatar($post, $class, $prefix=null)
	{
		$this->avatar($post, $class, $prefix);
	}

	public function post_meta($post, $class, $prefix=null, $separator='<br/>')
	{
		$this->output('<span class="'.$class.'-meta">');

		if (isset($prefix))
			$this->output($prefix);

		$order = explode('^', @$post['meta_order']);

		foreach ($order as $element) {
			switch ($element) {
				case 'what':
					$this->post_meta_what($post, $class);
					break;

				case 'when':
					$this->post_meta_when($post, $class);
					break;

				case 'where':
					$this->post_meta_where($post, $class);
					break;

				case 'who':
					$this->post_meta_who($post, $class);
					break;
			}
		}

		$this->post_meta_flags($post, $class);

		if (!empty($post['what_2'])) {
			$this->output($separator);

			foreach ($order as $element) {
				switch ($element) {
					case 'what':
						$this->output('<span class="'.$class.'-what">'.$post['what_2'].'</span>');
						break;

					case 'when':
						$this->output_split(@$post['when_2'], $class.'-when');
						break;

					case 'who':
						$this->output_split(@$post['who_2'], $class.'-who');
						break;
				}
			}
		}

		$this->output('</span>');
	}

	public function post_meta_what($post, $class)
	{
		if (isset($post['what'])) {
			$classes = $class.'-what';
			if (@$post['what_your'])
				$classes .= ' '.$class.'-what-your';

			if (isset($post['what_url']))
				$this->output('<a href="'.$post['what_url'].'" class="'.$classes.'">'.$post['what'].'</a>');
			else
				$this->output('<span class="'.$classes.'">'.$post['what'].'</span>');
		}
	}

	public function post_meta_when($post, $class)
	{
		$this->output_split(@$post['when'], $class.'-when');
	}

	public function post_meta_where($post, $class)
	{
		$this->output_split(@$post['where'], $class.'-where');
	}

	public function post_meta_who($post, $class)
	{
		if (isset($post['who'])) {
			$this->output('<span class="'.$class.'-who">');

			if (strlen(@$post['who']['prefix']))
				$this->output('<span class="'.$class.'-who-pad">'.$post['who']['prefix'].'</span>');

			if (isset($post['who']['data']))
				$this->output('<span class="'.$class.'-who-data">'.$post['who']['data'].'</span>');

			if (isset($post['who']['title']))
				$this->output('<span class="'.$class.'-who-title">'.$post['who']['title'].'</span>');

			// You can also use $post['level'] to get the author's privilege level (as a string)

			if (isset($post['who']['points'])) {
				$post['who']['points']['prefix'] = '('.$post['who']['points']['prefix'];
				$post['who']['points']['suffix'] .= ')';
				$this->output_split($post['who']['points'], $class.'-who-points');
			}

			if (strlen(@$post['who']['suffix']))
				$this->output('<span class="'.$class.'-who-pad">'.$post['who']['suffix'].'</span>');

			$this->output('</span>');
		}
	}

	public function post_meta_flags($post, $class)
	{
		$this->output_split(@$post['flags'], $class.'-flags');
	}

	public function post_tags($post, $class)
	{
		if (!empty($post['q_tags'])) {
			$this->output('<div class = "tags">');
			$this->post_tag_list($post, $class);
			$this->output('</div>');
		}
	}

	public function post_tag_list($post, $class)
	{
		$this->output('<ul>');

		foreach ($post['q_tags'] as $taghtml)
			$this->post_tag_item($taghtml, $class);

		$this->output('</ul>');
	}

	public function post_tag_item($taghtml, $class)
	{
		$this->output('<li>'.$taghtml.'</li>');
	}

	public function page_links()
	{
		$page_links = @$this->content['page_links'];

		if (!empty($page_links)) {
			$this->output('<div class="qa-page-links">');

			$this->page_links_label(@$page_links['label']);
			$this->page_links_list(@$page_links['items']);
			$this->page_links_clear();

			$this->output('</div>');
		}
	}

	public function page_links_label($label)
	{
		if (!empty($label))
			$this->output('<span class="qa-page-links-label">'.$label.'</span>');
	}

	public function page_links_list($page_items)
	{
		if (!empty($page_items)) {
			$this->output('<ul class="qa-page-links-list">');

			$index = 0;

			foreach ($page_items as $page_link) {
				$this->set_context('page_index', $index++);
				$this->page_links_item($page_link);

				if ($page_link['ellipsis'])
					$this->page_links_item(array('type' => 'ellipsis'));
			}

			$this->clear_context('page_index');

			$this->output('</ul>');
		}
	}

	public function page_links_item($page_link)
	{
		$this->output('<li class="qa-page-links-item">');
		$this->page_link_content($page_link);
		$this->output('</li>');
	}

	public function page_link_content($page_link)
	{
		$label = @$page_link['label'];
		$url = @$page_link['url'];

		switch ($page_link['type']) {
			case 'this':
				$this->output('<span class="qa-page-selected">'.$label.'</span>');
				break;

			case 'prev':
				$this->output('<a href="'.$url.'" class="qa-page-prev">&laquo; '.$label.'</a>');
				break;

			case 'next':
				$this->output('<a href="'.$url.'" class="qa-page-next">'.$label.' &raquo;</a>');
				break;

			case 'ellipsis':
				$this->output('<span class="qa-page-ellipsis">...</span>');
				break;

			default:
				$this->output('<a href="'.$url.'" class="qa-page-link">'.$label.'</a>');
				break;
		}
	}

	public function page_links_clear()
	{
		$this->output(
			'<div class="qa-page-links-clear">',
			'</div>'
		);
	}

	public function suggest_next()
	{
		$suggest = @$this->content['suggest_next'];

		if (!empty($suggest)) {
			$this->output('<div class="qa-suggest-next">');
			$this->output($suggest);
			$this->output('</div>');
		}
	}

	public function q_view($q_view)
	{	
		
		$q_view['voting_form_hidden']['code_vote'] = $q_view['voting_form_hidden']['code'];
		unset($q_view['voting_form_hidden']['code']);
		//echo '<pre>';print_r($q_view['voting_form_hidden']);exit;
		// Dont know what this does
		 if (!empty($q_view)) {
			$this->output('<div class="post-ans"><div class="qa-q-view'.(@$q_view['hidden'] ? ' qa-q-view-hidden' : '').rtrim(' '.@$q_view['classes']).'"'.rtrim(' '.@$q_view['tags']).'>');

			if (isset($q_view['main_form_tags']))
				$this->output('<form '.$q_view['main_form_tags'].'>'); // form for voting buttons

			//$this->q_view_stats($q_view);

			if (isset($q_view['main_form_tags'])) {
				//$this->form_hidden_elements(@$q_view['voting_form_hidden']);
				//$this->output('</form>');
			}

			$this->q_view_main($q_view);
			$this->q_view_clear();

			$this->output('</div></div> <!-- END qa-q-view -->', ''); 
			
			
			
			/* VARIABLES 
			$title_question = $this->content['q_view']['raw']['title'];
			
			
			$category =  empty($this->content['q_view']['raw']['categoryname'])? '':$this->content['q_view']['raw']['categoryname'];
			$category_prefix = ($category == null?'':'in');
			
			$name = $this->content['q_view']['raw']['handle'];
			$up_votes = $this->content['q_view']['raw']['upvotes'];
			$down_votes = $this->content['q_view']['raw']['downvotes'];
			
			
			$val = qa_when_to_html($this->content['q_view']['raw']['created'],gmdate("d", $this->content['q_view']['raw']['created']));
			$created_on = $val['data'];
			
			$this->output('
				
				<div class="col-sm-12 col-xs-12">
				<div class="post-ans">
					<div class="title">');echo $title_question;$this->output('</div>

					<div class="details">
						asked on '.$created_on.' '. $category_prefix .'
						<a href="#"> '); echo $category;   $this->output('  </a>
						by 
						<a href="#">');  echo $name;  $this->output(' </a>
					</div>
					<ul class="stats-list">
						<li>
							<img class="icon" src="'.$this->rooturl.'images/upvote.svg">
							<span class="number">
								');  echo $up_votes;  $this->output('
							</span>
						</li>
						<li>
							<img class="icon" src="q2a2\qa-theme\Snow1/'.$this->rooturl.'images/downvote.svg">
							<span class="number">
								');  echo $down_votes;  $this->output('
							</span>
						</li>
						<li>
							<img class="icon" src="'.$this->rooturl.'images/flag.svg">
							<span class="number">
								flag
							</span>
						</li>
						<li>
							<img class="icon" src="'.$this->rooturl.'images/answers.svg">
							<span class="number">
								answers
							</span>
						</li>
						<li>
							<img class="icon" src="'.$this->rooturl.'images/comments.svg">
							<span class="number">
								comments
							</span>
						</li>
					</ul>
					<div class="ans-heading">
						Your answer
					</div>
					<div class="form-group">
						<trix-editor angular-trix ng-model="quesDetails"></trix-editor>
					</div>

					<div class="form-group">
						<label>Preview:</label>
						<div class = "preview" ng-bind="quesDetails"></div>
					</div>
					<div class="form-group form-inline browse-file">
						<label class="visible-xs">Attach files:</label>

						<input type="file" class="form-control file-input" style="display:none;">
						<button class="btn btn-default btn-green hidden-xs browse-btn" type="button">Attach files</button> &nbsp;
						<div class="input-group">
							<input type="input" class="form-control text-input" disabled="true">
							<div class="input-group-btn">
								<button class="btn btn-default btn-gray browse-btn" type="button">Browse</button>
							</div>
						</div>
					</div>
				</div>
				<hr/>
				<div class="form-group">
					<input id="notify" type="checkbox"> 
					<label for="notify" style="display:flex;"><span><span></span></span>Email me if my answer is selected or commented on</label>
				</div>
				<hr/>
				<div class="form-group">
					<button class="btn btn-default btn-green" type="button">Add answer</button>
				</div>
			</div>
				
			');*/
			
		}
	}

	public function q_view_stats($q_view)
	{
		$this->output('<div class="qa-q-view-stats">');

		$this->voting($q_view);
		$this->a_count($q_view);

		$this->output('</div>');
	}

	public function q_view_main($q_view)
	{	// echo "String -3 ";
		$this->output('<div class="qa-q-view-main">');

		if (isset($q_view['main_form_tags']))
			$this->output('<form '.$q_view['main_form_tags'].'>'); // form for buttons on question

		//$this->view_count($q_view);
		
		$this->q_view_title($q_view);
		$this->q_view_content($q_view);
		$this->q_view_extra($q_view);
		$this->q_view_follows($q_view);
		$this->q_view_closed($q_view);
		$this->post_tags($q_view, 'qa-q-view');
		$this->post_avatar_meta($q_view, 'qa-q-view');
		$this->q_view_buttons($q_view);
		$this->c_list(@$q_view['c_list'], 'qa-q-view');

		if (isset($q_view['main_form_tags'])) {
			$this->form_hidden_elements(@$q_view['voting_form_hidden']);
			$this->form_hidden_elements(@$q_view['buttons_form_hidden']);
			$this->output('</form>');
		}

		$this->c_form(@$q_view['c_form']);

		$this->output('</div> <!-- END qa-q-view-main -->'); 
	}

	public function q_view_title($q_view)
	{
	//echo $q_view['title'];
		$content = isset($q_view['content']) ? $q_view['content'] : '';
//echo '<pre>';print_r($q_view);
		$this->output('<div class="title">');
		echo $q_view['raw']['title'];
		$this->output('</div>');
	}
	
	public function q_view_content($q_view)
	{
	//echo $q_view['title'];
		$content = isset($q_view['content']) ? $q_view['content'] : '';
//echo '<pre>';print_r($q_view);
		$this->output('<div class="details">');
		echo $q_view['content'];
		$this->output('</div>');
	}

	public function q_view_follows($q_view)
	{
		if (!empty($q_view['follows']))
			$this->output(
				'<div class="qa-q-view-follows">',
				$q_view['follows']['label'],
				'<a href="'.$q_view['follows']['url'].'" class="qa-q-view-follows-link">'.$q_view['follows']['title'].'</a>',
				'</div>'
			);
	}

	public function q_view_closed($q_view)
	{
		if (!empty($q_view['closed'])) {
			$haslink = isset($q_view['closed']['url']);

			$this->output(
				'<div class="qa-q-view-closed">',
				$q_view['closed']['label'],
				($haslink ? ('<a href="'.$q_view['closed']['url'].'"') : '<span').' class="qa-q-view-closed-content">',
				$q_view['closed']['content'],
				$haslink ? '</a>' : '</span>',
				'</div>'
			);
		}
	}

	public function q_view_extra($q_view)
	{
		if (!empty($q_view['extra'])) {
			$this->output(
				'<div class="qa-q-view-extra">',
				$q_view['extra']['label'],
				'<span class="qa-q-view-extra-content">',
				$q_view['extra']['content'],
				'</span>',
				'</div>'
			);
		}
	}

	public function q_view_buttons($q_view)
	{
	
		$this->output('<div class="votes"><ul '.@$q_view['vote_tags'].' class="stats-list">');
		$this->voting($q_view);
		if (!empty($q_view['form'])) {
				foreach($q_view['form']['buttons'] as $key=>$value) {
					$this->output('<li>');
					
					$this->output('<input '.$value['tags'].' value="'.$value['label'].'" title="'.$value['popup'].'" type="submit" class="qa-form-light-button qa-form-light-button-'.$key.'">');
					
						$this->output('</li>');
				}
				
			}
		$this->output('</ul></div>');
	}

	public function q_view_clear()
	{
		$this->output(
			'<div class="qa-q-view-clear">',
			'</div>'
		);
	}

	public function a_form($a_form)
	{
		$this->output('<div class="qa-a-form"'.(isset($a_form['id']) ? (' id="'.$a_form['id'].'"') : '').
			(@$a_form['collapse'] ? ' style="display:none;"' : '').'>');

		$this->form($a_form);
		$this->c_list(@$a_form['c_list'], 'qa-a-item');

		$this->output('</div> <!-- END qa-a-form -->', '');
	}

	public function a_list($a_list)
	{	
		
		 if (!empty($a_list)) {
			$this->part_title($a_list);

			$this->output('<div class="post-ans"><div class="qa-a-list'.($this->list_vote_disabled($a_list['as']) ? ' qa-a-list-vote-disabled' : '').'" '.@$a_list['tags'].'>', '');
			$this->a_list_items($a_list['as']);
			$this->output('</div></div> <!-- END qa-a-list -->', '');
		}  
	}

	public function a_list_items($a_items)
	{
		foreach ($a_items as $a_item)
			$this->a_list_item($a_item);
	}

	public function a_list_item($a_item)
	{
		$extraclass = @$a_item['classes'].($a_item['hidden'] ? ' qa-a-list-item-hidden' : ($a_item['selected'] ? ' qa-a-list-item-selected' : ''));

		$this->output('<div class="qa-a-list-item '.$extraclass.'" '.@$a_item['tags'].'>');

		if (isset($a_item['main_form_tags']))
			$this->output('<form '.$a_item['main_form_tags'].'>'); // form for voting buttons

		//$this->voting($a_item);

		if (isset($a_item['main_form_tags'])) {
			$this->form_hidden_elements(@$a_item['voting_form_hidden']);
			$this->output('</form>');
		}

		$this->a_item_main($a_item);
		$this->a_item_clear();

		$this->output('</div> <!-- END qa-a-list-item -->', '');
	}

	public function a_item_main($a_item)
	{	
		//$this->answers_custom($a_list);
		$a_item['voting_form_hidden']['code_vote'] = $a_item['voting_form_hidden']['code'];
		unset($a_item['voting_form_hidden']['code']);
		
		//print_r($a_item['voting_form_hidden']);exit;
		$this->output('<div class="qa-a-item-main">');

		if (isset($a_item['main_form_tags'])) {
			$this->output('<form '.$a_item['main_form_tags'].'>'); // form for buttons on answer
			$this->form_hidden_elements(@$a_item['voting_form_hidden']);
		}
			

		if ($a_item['hidden'])
			$this->output('<div class="qa-a-item-hidden">');
		elseif ($a_item['selected'])
			$this->output('<div class="qa-a-item-selected">');

		
		$this->error(@$a_item['error']);
		$this->a_item_content($a_item);
		$this->post_avatar_meta($a_item, 'qa-a-item');

		if ($a_item['hidden'] || $a_item['selected'])
			$this->output('</div>');

		$this->a_item_buttons($a_item);

		$this->c_list(@$a_item['c_list'], 'qa-a-item');

		if (isset($a_item['main_form_tags'])) {
			$this->form_hidden_elements(@$a_item['buttons_form_hidden']);
			$this->output('</form>');
		}

		$this->c_form(@$a_item['c_form']);

		$this->output('</div> <!-- END qa-a-item-main -->');
	}

	public function a_item_clear()
	{
		$this->output(
			'<div class="qa-a-item-clear">',
			'</div>'
		);
	}

	public function a_item_content($a_item)
	{
		$this->output('<div class="qa-a-item-content">');
		$this->output_raw($a_item['content']);
		$this->output('</div>');
	}

	public function a_item_buttons($a_item)
	{
	//echo '<pre>';print_r($a_item['form']);
		if (!empty($a_item['form'])) {
			/*$this->output('<div class="qa-a-item-buttons">');
			$this->form($a_item['form']);
			$this->output('</div>');*/
			
			
			$this->output('<ul '.@$a_item['vote_tags'].' class="stats-list">');
						$this->a_selection($a_item);
						$this->voting($a_item);
						
		if (!empty($a_item['form'])) {
		foreach($a_item['form']['buttons'] as $key=>$value) {
			$this->output('<li>');
			$this->output('<input '.$value['tags'].' value="'.$value['label'].'" title="'.$value['popup'].'" type="submit" class="qa-form-light-button qa-form-light-button-'.$key.'">');
			$this->output('</li>');
			/*switch($key) {
				case 'edit':
					$this->output('<input name="q_doedit" value="edit" title="Edit this question" type="submit" class="qa-form-light-button qa-form-light-button-edit">');
					break;
				case 'close':
					$this->output('<input name="q_doclose" value="close" title="Close this question to any new answers" type="submit" class="qa-form-light-button qa-form-light-button-close">');
					break;
				case 'hide':
					$this->output('<input name="q_dohide" onclick="qa_show_waiting_after(this, false);" value="hide" title="Hide this question" type="submit" class="qa-form-light-button qa-form-light-button-hide">');
					break;
				case 'answer':
					$this->output('<input '.$value['tags'].' value="answer" title="Answer this question" type="submit" class="qa-form-light-button qa-form-light-button-answer">');
					break;
				case 'comment':
					$this->output('<input '.$value['tags'].' value="comment" title="Add a comment on this question" type="submit" class="qa-form-light-button qa-form-light-button-comment">');
					break;
				case 'follow':
					$this->output('<input '.$value['tags'].' value="ask related question" title="Ask a new question relating to this answer" type="submit" class="qa-form-light-button qa-form-light-button-follow">');
					break;
				
				
				
			}*/
			
		}
			$this->output('</ul>');
		}
			
		}
	}

	public function c_form($c_form)
	{
		$this->output('<div class="qa-c-form"'.(isset($c_form['id']) ? (' id="'.$c_form['id'].'"') : '').
			(@$c_form['collapse'] ? ' style="display:none;"' : '').'>');

		$this->form($c_form);

		$this->output('</div> <!-- END qa-c-form -->', '');
	}

	public function c_list($c_list, $class)
	{
		if (!empty($c_list)) {
			$this->output('', '<div class="'.$class.'-c-list"'.(@$c_list['hidden'] ? ' style="display:none;"' : '').' '.@$c_list['tags'].'>');
			$this->c_list_items($c_list['cs']);
			$this->output('</div> <!-- END qa-c-list -->', '');
		}
	}

	public function c_list_items($c_items)
	{
		foreach ($c_items as $c_item)
			$this->c_list_item($c_item);
	}

	public function c_list_item($c_item)
	{
		$extraclass = @$c_item['classes'].(@$c_item['hidden'] ? ' qa-c-item-hidden' : '');

		$this->output('<div class="qa-c-list-item '.$extraclass.'" '.@$c_item['tags'].'>');

		$this->c_item_main($c_item);
		$this->c_item_clear();

		$this->output('</div> <!-- END qa-c-item -->');
	}

	public function c_item_main($c_item)
	{
		$this->error(@$c_item['error']);

		if (isset($c_item['expand_tags']))
			$this->c_item_expand($c_item);
		elseif (isset($c_item['url']))
			$this->c_item_link($c_item);
		else
			$this->c_item_content($c_item);

		$this->output('<div class="qa-c-item-footer">');
		$this->post_avatar_meta($c_item, 'qa-c-item');
		$this->c_item_buttons($c_item);
		$this->output('</div>');
	}

	public function c_item_link($c_item)
	{
		$this->output(
			'<a href="'.$c_item['url'].'" class="qa-c-item-link">'.$c_item['title'].'</a>'
		);
	}

	public function c_item_expand($c_item)
	{
		$this->output(
			'<a href="'.$c_item['url'].'" '.$c_item['expand_tags'].' class="qa-c-item-expand">'.$c_item['title'].'</a>'
		);
	}

	public function c_item_content($c_item)
	{
		$this->output('<div class="qa-c-item-content">');
		$this->output_raw($c_item['content']);
		$this->output('</div>');
	}

	public function c_item_buttons($c_item)
	{
		if (!empty($c_item['form'])) {
			$this->output('<div class="qa-c-item-buttons">');
			$this->form($c_item['form']);
			$this->output('</div>');
		}
	}

	public function c_item_clear()
	{
		$this->output(
			'<div class="qa-c-item-clear">',
			'</div>'
		);
	}


	public function q_title_list($q_list, $attrs=null)
/*
	Generic method to output a basic list of question links.
*/
	{
		$this->output('<ul class="qa-q-title-list">');
		foreach ($q_list as $q) {
			$this->output(
				'<li class="qa-q-title-item">',
				'<a href="' . qa_q_path_html($q['postid'], $q['title']) . '" ' . $attrs . '>' . qa_html($q['title']) . '</a>',
				'</li>'
			);
		}
		$this->output('</ul>');
	}

	public function q_ask_similar($q_list, $pretext='')
/*
	Output block of similar questions when asking.
*/
	{
		if (!count($q_list))
			return;

		$this->output('<div class="qa-ask-similar">');

		if (strlen($pretext) > 0)
			$this->output('<p class="qa-ask-similar-title">'.$pretext.'</p>');
		$this->q_title_list($q_list, 'target="_blank"');

		$this->output('</div>');
	}

	public function main_parts_users($content)
	{
		//echo '<pre>';print_r($content['ranking']['items']);exit;
	
		$this->output('<div class="row">');
            for( $i = 0; $i < sizeof($content['ranking']['items']); $i++ ){
                                
            // Variables 
            $user_name = $content['ranking']['items'][$i]['raw']['handle'];
            $email_id = $content['ranking']['items'][$i]['raw']['email'];
			$score = $content['ranking']['items'][$i]['raw']['points'];
			$loggedin = $content['ranking']['items'][$i]['raw']['loggedin'];
			
			$datetime1 = new DateTime($loggedin);
			$datetime2 = new DateTime();
			$interval = $datetime1->diff($datetime2);
			$image = $content['ranking']['items'][$i]['avatar']!='' ? $content['ranking']['items'][$i]['avatar']:'<img src="'.$this->rooturl.'images/claim-icon.png" height="80" width="80" />';
			$rank = $i+1;
			$this->output('<div class="col-xs-12 col-sm-6 col-md-4">
                        	   <div class="user-box">
                                    <div class="header">
                                        <div class ="row">
											<div class="pic col-lg-4 col-xs-5">
												<a href="'.qa_path('user', array('qa_1'=>$user_name)).'">'.$image.'</a>
											</div>                                        
                                            <div class="name col-lg-8 col-xs-7">
                                            <div class="one">');
                                                echo $user_name;
                                                $this->output('</div>
                                	            <div class="two">
                                                    chicago, IL
                                                </div>
                                                <div class="three">');
                                                	echo $email_id;
                                                    $this->output(' 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="body">
                                        <div class="row stats">
                                            <div class="col-xs-3 ">
                                    	        <div class="text">
                                        	        points
                                                </div>
                                            <div class="number">');
                                            	echo $score;
                                                $this->output('</div>
                                                        </div>
                                            <div class="col-xs-3 border ">
                                                <div class="text">
                                                    rank
 	                                            </div>
                                                <div class="number">');
                                                echo $rank;
                                                $this->output('</div>
                                                </div>
                                                <div class="col-xs-3 border">
                                                <div class="text">
                                                    silver
                                                </div>
                                                <div class="number">
                                                    4
                                                </div>
                                            </div>
                                            <div class="col-xs-3 border">
                                                <div class="text">
                                                    bronze
                                                </div>
                                            <div class="number">
                                                1
                                            </div>
                                        </div>
                                    </div>
									<div class="tags">
										<div class="title">
										tags
										</div>
										<div class="list">
											devstack, linux, metadata, -dev, metadata, configuration, migration
										</div>
									</div>
								</div>
								<div class="footer">');                                                                                                                           echo $interval->format('%R%a days %R%h hrs %R%i mins').'  ago';
							$this->output('	</div>
							</div>
						</div>');
					}
			$this->output('</div>');
	}






	public function main_parts_user($content){
		//echo '<pre>';print_r($content);
		/* VARIABLES */
		$content = $this->content;
		$handle =  $content['raw']['account']['handle'];
		$score = $content['raw']['account']['points'];
		
		//LevelLevel
		$level = $content['form_profile']['fields']['level']['value'];  
		
		//Activity - Questions, responses,comments		
		$questions = $content['raw']['points']['qposts'];
		$responses = $content['raw']['points']['aposts'];
		$comments = $content['raw']['points']['cposts'];
		
		//voted on - questions, responses
		$qvotes = $content['raw']['points']['qupvotes']+ $content['raw']['points']['qdownvotes'];
		$avotes = $content['raw']['points']['aupvotes']+ $content['raw']['points']['adownvotes'];
		
		//awarded - upvotes, downvotes
		$awared_votes_up =  $content['raw']['points']['qupvotes']+ $content['raw']['points']['aupvotes'];
		$awared_votes_down =  $content['raw']['points']['qdownvotes']+ $content['raw']['points']['adownvotes'];

		//Recieved - upvotes, downvotes
		$recieved_up_votes =  $content['raw']['points']['upvoteds'];
		$recieved_down_votes =  $content['raw']['points']['downvoteds'];
		if(isset($content['form_profile']['fields']['avatar']['html'])){
			$image = $content['form_profile']['fields']['avatar']['html'];
		} else if(isset( $content['raw']['accounts']['avatarblobid'])) {
			$image = '<img src="'.$content['raw']['accounts']['avatarblobid'].'" height="80" width="80" />';
		} else {
			$image ='<img src="'.$this->rooturl.'images/claim-icon.png" height="80" width="80" />';
		}

		$userid = $content['raw']['account']['userid'];
		$result = qa_db_read_all_values(
			qa_db_query_sub(
				'SELECT badge_slug FROM ^userbadges WHERE user_id=#',
				$userid
			)
		);

		$this->output('
				<div class="page-content">
					<div class="row user-box details-page">
						<div class="col-md-4 col-sm-5 col-xs-12 header">
							<div class ="row">
								<div class="pic col-lg-4 col-sm-6 col-xs-12">
									'.$image.'
								</div>
								<div class="name col-lg-8 col-sm-6 col-xs-12">
									<div class="one">
										'.$handle.'	
									</div>
									<div class="two">
										chicago, IL
									</div>
									<div class="three">
										www.timursufev.com
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5 col-sm-7 col-xs-12 user-desc">
							Description about user profile, IT consultant, Developer/Admin for 3 years etc.
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12 other-details">
							<div class="col-md-12 col-sm-6 border">
								'.$level.'
							</div>
							<div class="col-md-12 col-sm-6">
								12th August
							</div>
						</div>
					</div>
					<div class="row user-stats">
						<div class="score col-md-2 col-sm-3 partition border">
							<div class="header">
								score
							</div>
							<div class="content">
								<ul>
									<li>
										<span class="text">points</span>
										<br/>
										<span class="number">'.$score.'</span>
									</li>
									<li class="border">
										<span class="text">rank</span>
										<br/>
										<span class="number">208</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="activity col-md-4 col-sm-5 partition border">
							<div class="header">
								activity
							</div>
							<div class="content">
								<ul>
									<li >
										<span class="text">questions</span>
										<br/>
										<span class="number">'.$questions.'</span>
									</li>
									<li class="border">
										<span class="text">responses</span>
										<br/>
										<span class="number">'.$responses.'</span>
									</li>
									<li class="border">
										<span class="text">comments</span>
										<br/>
										<span class="number">'.$comments .'</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="voted-on col-md-2 col-sm-4 partition border">
							<div class="header">
								voted on
							</div>
							<div class="content">
								<ul>
									<li >
										<span class="text">questions</span>
										<br/>
										<span class="number">'.$qvotes.'</span>
									</li>
									<li class="border">
										<span class="text">responses</span>
										<br/>
										<span class="number">'.$avotes.'</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="awarded col-md-2 col-sm-4 partition border">
							<div class="header">
								awarded
							</div>
							<div class="content">
								<ul>
									<li>
										<span class="text">upvotes</span>
										<br/>
										<span class="number">'.$awared_votes_up.'</span>
									</li>
									<li  class="border">
										<span class="text">downvotes</span>
										<br/>
										<span class="number">'.$awared_votes_down.'</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="recieved col-md-2 col-sm-4 partition">
							<div class="header">
								recieved
							</div>
							<div class="content">
								<ul>
									<li >
										<span class="text">upvotes</span>
										<br/>
										<span class="number">'.$recieved_up_votes.'</span>
									</li>
									<li class="border">
										<span class="text">downvotes</span>
										<br/>
										<span class="number">'.$recieved_down_votes.'</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row userpage-title">
						<span class="text">Badges</span>
						<img src="'.$this->rooturl.'images/silver.svg" class="icon">
						<span class="number">'.count($result).'</span>
					</div>
					<div class="row nm">
						<div class="col-xs-12 badge-box">
							<div class="title">
								Gold - 3
							</div>
							<div class="badge-list border">
								<div class="icon">
									<img src="'.$this->rooturl.'images/gold.svg">
								</div>
								<div class="badges">
									');
								
									$this->output('
									<ul >');
								foreach ($result as $badge) {
								
								$this->output('
									
									<li class="border">
										<div class="text">'.$badge.'</div>
										<div class="number">'.count($badge).'</div>
									</li>');								
							}
							$this->output('
									</ul >');
						
							$this->output('
								</div>
							</div>
							<div class="title">
								Silver - 5
							</div>
							<div class="badge-list border">
								<div class="icon">
									<img src="'.$this->rooturl.'images/silver.svg">
								</div>
								<div class="badges">
								<ul >
									<li class="border">
										<div class="text">asker</div>
										<div class="number">2</div>
									</li>
									<li class="border">
										<div class="text">answerer</div>
										<div class="number">3</div>
									</li>
									<li class="border">
										<div class="text">100 club</div>
										<div class="number">1</div>
									</li>
									<li class="border">
										<div class="text">verified human</div>
										<div class="number">1</div>
									</li>
									<li>
										<div class="text">notable question</div>
										<div class="number">1</div>
									</li>
								</ul>
								</div>
							</div>
							<div class="title">
								bronze - 3
							</div>
							<div class="badge-list">
								<div class="icon">
									<img src="'.$this->rooturl.'images/bronze.svg">
								</div>
								<div class="badges">
									<ul>
										<li class="border">
											<div class="text">
												1,000 club
											</div>
											<div class="number">
												2
											</div>
										</li>
										<li class="border">
											<div class="text">
												questioner
											</div>
											<div class="number">
												1
											</div>
										</li>
										<li>
											<div class="text">
												lecturer
											</div>
											<div class="number">
												0
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row userpage-title">
						<span class="text">tags</span>
					</div>
					<div class = "tags">
						<ul>
							<li>
								-auth
							</li>
							<li>
								neutron
							</li>
							<li>
								devstack
							</li>
							<li>
								nuova
							</li>
							<li>
								neutron
							</li>
							<li>
								devstack
							</li>
							<li>
								migration
							</li>
						</ul>
					</div>
					<div class="row userpage-title">
						<span class="text">recent questions</span>
					</div>
					<nav class="navbar navbar-default sub-menu">
						<ul class="nav navbar-nav" style="margin-bottom:-2px;">
							<li>
								<a href="#">Recent Activity</a>
							</li>
							<li>
								<a href="#">all questions</a>
							</li>
							<li>
								<a href="#">all responses</a>
							</li>
						</ul>
					</nav>
					<div class = "post">
						<div class="post-title">
							[openstack-dev][neutron] Syncing neutron DB and OVN DB 
						</div>
						<div class = "details">
							asked 16 minutes ago in 
							<span class = "orange"> openstack-dev </span>
							by 
							<span class="orange"> gal.sagie_at_gmail.c </span>
							(4,320 points)
						</div>
						<div class = "tags">
							<ul>
								<li>
									nuova
								</li>
								<li>
									neutron
								</li>
								<li>
									devstack
								</li>
								<li>
									migration
								</li>
							</ul>
						</div>
						<div class = "votes">
							<ul>
								<li class = "vote border">
									<img src = "'.$this->rooturl.'images/upvote.svg">
									<span class = "vote-count up">72</span>
								</li >
								<li class = "vote border">
									<img src = "'.$this->rooturl.'images/downvote.svg">
									<span class = "vote-count down">0</span>
								</li>
								<li class = "stats border">
									<p>
										Responses -
										<span class = "count">20</span>
									</p>
								</li>
								<li class = "stats">
									<p>
										Views -
										<span class = "count">24</span>
									</p>
								</li>
							</ul>
						</div>
						<ul class="icons-right">
							<li class="icon">
								<img src="'.$this->rooturl.'images/gold.svg">
							</li>
							<li class="text">
								2
							</li>
							<li class="icon">
								<img src="'.$this->rooturl.'images/bronze.svg">
							</li>
							<li class="text">
								6
							</li>
							<li class="icon">
								<img src="'.$this->rooturl.'images/silver.svg">
							</li>
							<li class="text">
								2
							</li>
						</ul>
					</div>
				</div>

			
		');
	}

	public function main_parts_dashboard($content){
			
		
		/* VARIABLES  */
		$page_views_last_month = $content['dashboard_details']['page_views_last_month'];
		$questions = $content['dashboard_details']['questions'];
		$responses = $content['dashboard_details']['responses'];
		$comments = $content['dashboard_details']['comments'];
		$users = $content['dashboard_details']['users'];
		$highest_answers = $content['dashboard_details']['highest_answers'];
		$lowest_anwers = $content['dashboard_details']['lowest_anwers'];
		$highest_questions = $content['dashboard_details']['highest_questions'];
		$lowest_questions = $content['dashboard_details']['lowest_questions'];
		
		
		$this->output('
			
			<div class="container">
	<div class="row">
		<ul class="dashboard-stats">
			<li class="blue">
				<div class="icon  hidden-xs">
					<img src="'.$this->rooturl.'images/dashboard_page_view.svg">
				</div>
				<div class="content">
					<div class="number">
						'.$page_views_last_month.'
					</div>
					<div class="text">
						page views last month
					</div>
				</div>
			</li>
			<li class="black">
				<div class="icon hidden-xs">
					<img src="'.$this->rooturl.'images/dashboard_questions.svg">
				</div>
				<div class="content">
					<div class="number">
						'.$questions.'
					</div>
					<div class="text">
						questions
					</div>
				</div>
			</li>
			<li class="green">
				<div class="icon hidden-xs">
					<img src="'.$this->rooturl.'images/dashboard_responses.svg">
				</div>
				<div class="content">
					<div class="number">
						'.$responses.'
					</div>
					<div class="text">
						Responses
					</div>
				</div>
			</li>
			<li class="orange">
				<div class="icon hidden-xs">
					<img src="'.$this->rooturl.'images/dashboard_comments.svg">
				</div>
				<div class="content">
					<div class="number">
						'.$comments.'
					</div>
					<div class="text">
						comments
					</div>
				</div>
			</li>
			<li class="gray">
				<div class="icon hidden-xs">
					<img src="'.$this->rooturl.'images/dashboard_users.svg">
				</div>
				<div class="content">
					<div class="number">
						'.$users.'
					</div>
					<div class="text">
						users
					</div>
				</div>
			</li>
		</ul>
	</div>		
	<div class="row flex-box content-box">
		<div class="col-md-10 col-sm-9">
			<div class="row ">
				<div class="title">
					number of posts by category/dl
					<ul class="pull-right content-list">
						<li>
							<span class="dot blue"></span>
							<span>questions</span>
						</li>
						<li>
							<span class="dot orange"></span>
							<span>answers</span>
						</li>
					</ul>
				</div>
				<img src="placeholders/1.png" style="width:100%;">
			</div>
		</div>
		<div class="col-md-2 col-sm-3 border">
			<ul class="by-cat-stats">
				<li class="border">
					<div class="title">
						highest answers
					</div>
					<div class="number">
						'.$highest_answers.'
					</div>
					<div class="text">
						openstack dev
					</div>
				</li>	
				<li class="border">
					<div class="title">
						lowest answers
					</div>
					<div class="number">
						'.$lowest_anwers.'
					</div>
					<div class="text">
						openstack announce
					</div>
				</li>
				<li class="border">
					<div class="title">
						highest questions
					</div>
					<div class="number">
						'.$highest_questions.'
					</div>
					<div class="text">
						openstack dev
					</div>
				</li>
				<li>
					<div class="title">
						lowest questions
					</div>
					<div class="number">
						'.$lowest_questions.'
					</div>
					<div class="text">
						openstack qa
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="row flex-box">
		<div class="col-sm-6 col-xs-12">
			<div class="row full-height">
				<div class="content-box gap">
					<div class="title">
						content creation
						<div class="sub-title">
							Number of messages in each category
						</div>
					</div>
					<div class="content">
						<ul class="tabbed-view">
							<li>
								yearly
							</li>
							<li class="active">
								quaterly
							</li>
							<li>
								monthly
							</li>
							<li>
								weekly
							</li>
						</ul>
						<ul class="content-list">
							<li>
								<span class="dot blue"></span>
								<span>openstack-dev</span>
							</li>
							<li>
								<span class="dot orange"></span>
								<span>openstack</span>
							</li>
							<li>
								<span class="dot green"></span>
								<span>openstack</span>
							</li>
							<li>
								<span class="dot pink"></span>
								<span>openstack</span>
							</li>
							<li>
								<span class="dot purple"></span>
								<span>openstack-qa</span>
							</li>
							<li>
								<span class="dot blue"></span>
								<span>openstack-dev</span>
							</li>
							<li>
								<span class="dot orange"></span>
								<span>openstack</span>
							</li>
							<li>
								<span class="dot green"></span>
								<span>openstack-qa</span>
							</li>
							<li>
								<span class="dot pink"></span>
								<span>openstack</span>
							</li>
							<li>
								<span class="dot purple"></span>
								<span>openstack-qa</span>
							</li>
						</ul>
						<img src="placeholders/2.png" style="width:100%;">
						<hr/>
						<label><b>
							VIEW BY CATEGORY
							</b></label>
						<div class="as-select">
							<div class="select-default">
								Categories
								<span class="pull-right glyphicon glyphicon-menu-down"></span>
							</div>
							<ul class="option">
								<li class="">
									<input id="u11" type="checkbox">
									<label for="u11"><span><span></span></span>User 01</label>
								</li>
								<li class="">
									<input id="u21" type="checkbox">
									<label for="u21"><span><span></span></span>User 02</label>
								</li>
								<li class="">
									<input id="u31" type="checkbox">
									<label for="u31"><span><span></span></span>User 03</label>
								</li>
								<li class="">
									<input id="u41" type="checkbox">
									<label for="u41"><span><span></span></span>User 04</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="row  full-height">
				<div class="content-box">
					<div class="title">
						content consumption
						<div class="sub-title">
							Number of searches and views overtime
						</div>
					</div>
					<div class="content">
						<ul class="tabbed-view">
							<li>
								yearly
							</li>
							<li class="active">
								quaterly
							</li>
							<li>
								monthly
							</li>
							<li>
								weekly
							</li>
						</ul>
						<ul class="content-list">
							<li>
								<span class="dot blue"></span>
								<span>search</span>
							</li>
							<li>
								<span class="dot orange"></span>
								<span>view</span>
							</li>
							<li>
								<span class="dot green"></span>
								<span>search + view</span>
							</li>
						</ul>
						<img src="placeholders/3.png" style="width:100%;">
						<hr/>
						<label><b>
							VIEW BY CATEGORY
							</b></label>
						<ul class="checkbox-list">
							<li>
								<input id="s" type="checkbox">
								<label for="s"><span><span></span></span>Search</label>
							</li>
							<li>
								<input id="v" type="checkbox">
								<label for="v"><span><span></span></span>View</label>
							</li>
							<li class="form-group">
								<input id="sv" type="checkbox">
								<label for="sv"><span><span></span></span>Search + View</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row flex-box">
		<div class="col-sm-6 col-xs-12">
			<div class="row  full-height">
				<div class="content-box gap">
					<div class="title">
						visitors
						<ul class="pull-right content-list">
							<li>
								<span class="dot orange"></span>
								<span>visitor</span>
							</li>
						</ul>
						<div class="sub-title">
							number of logged users
						</div>
					</div>
					<div class="content">
						<ul class="fig-list">
							<li>
								<div class="icon">
									<img src="'.$this->rooturl.'images/dashboard_visitors_pageview.svg">
								</div>
								<div class="details">
									<div class="number">
										23,200
									</div>
									<div class="text">
										views
									</div>
								</div>
							</li>
							<li>
								<div class="icon">
									<img src="'.$this->rooturl.'images/dashboard_visitors_up.svg">
								</div>
								<div class="details">
									<div class="number">
										0.7%
									</div>
									<div class="text">
										up
									</div>
								</div>
							</li>
						</ul>
						<ul class="tabbed-view">
							<li>
								yearly
							</li>
							<li class="active">
								quaterly
							</li>
							<li>
								monthly
							</li>
							<li>
								weekly
							</li>
						</ul>
						<img src="placeholders/4.png" style="width:100%;">
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="row  full-height">
				<div class="content-box">
					<div class="title">
						top visitors
						<div class="sub-title">
							number of searches and views
						</div>
					</div>
					<div class="content">
						<ul class="tabbed-view">
							<li>
								yearly
							</li>
							<li class="active">
								quaterly
							</li>
							<li>
								monthly
							</li>
							<li>
								weekly
							</li>
						</ul>
						<ul class="content-list visitors">
							<li>
								<span class="dot blue"></span>
								<span>anonymous</span>
							</li>
							<li>
								<span class="dot orange"></span>
								<span>John</span>
							</li>
							<li>
								<span class="dot green"></span>
								<span>John</span>
							</li>
							<li>
								<span class="dot pink"></span>
								<span>anonymous</span>
							</li>
							<li>
								<span class="dot purple"></span>
								<span>anonymous</span>
							</li>
							<li>
								<span class="dot blue"></span>
								<span>anonymous</span>
							</li>
							<li>
								<span class="dot orange"></span>
								<span>John</span>
							</li>
							<li>
								<span class="dot green"></span>
								<span>anonymous</span>
							</li>
							<li>
								<span class="dot pink"></span>
								<span>John</span>
							</li>
							<li>
								<span class="dot purple"></span>
								<span>John</span>
							</li>
						</ul>
						<img src="placeholders/5.png" style="width:100%;">
						<hr/>
						<label><b>
							VIEW BY CATEGORY:
							</b></label>
						<div class="as-select">
							<div class="select-default">
								Categories
								<span class="pull-right glyphicon glyphicon-menu-down"></span>
							</div>
							<ul class="option">
								<li class="">
									<input id="u1" type="checkbox">
									<label for="u1"><span><span></span></span>User 01</label>
								</li>
								<li class="">
									<input id="u2" type="checkbox">
									<label for="u2"><span><span></span></span>User 02</label>
								</li>
								<li class="">
									<input id="u3" type="checkbox">
									<label for="u3"><span><span></span></span>User 03</label>
								</li>
								<li class="">
									<input id="u4" type="checkbox">
									<label for="u4"><span><span></span></span>User 04</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row content-box">
		<div class="col-xs-12">
			<div class="row ">
				<div class="title">
					most active users
					<ul class="pull-right content-list">
						<li>
							<span class="dot blue"></span>
							<span>questions</span>
						</li>
						<li>
							<span class="dot orange"></span>
							<span>answers</span>
						</li>
					</ul>
				</div>
				<img src="placeholders/6.png" style="width:100%;">
			</div>
		</div>
	</div>
	<div class="row content-box">
		<div class="col-xs-12">
			<div class="row ">
				<div class="title">
					users responding to most number of threads
					<ul class="pull-right content-list">
						<li>
							<span class="dot blue"></span>
							<span>answered threads</span>
						</li>
					</ul>
				</div>
				<img src="placeholders/7.png" style="width:100%;">
			</div>
		</div>
	</div>
</div>
			
		');
		
	}
	
}

	

