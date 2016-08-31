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
						'<label for="qam-rememberme" class="qam-remember">'.qa_lang_html('users/remember').'</label></div>',
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
		if (qa_is_logged_in()) // output user avatar to login bar
			$this->output(
				'<div class="qa-logged-in-avatar">',
				QA_FINAL_EXTERNAL_USERS
				? qa_get_external_avatar_html(qa_get_logged_in_userid(), 24, true)
				: qa_get_user_avatar_html(qa_get_logged_in_flags(), qa_get_logged_in_email(), qa_get_logged_in_handle(),
					qa_get_logged_in_user_field('avatarblobid'), qa_get_logged_in_user_field('avatarwidth'), qa_get_logged_in_user_field('avatarheight'),
					24, true),
				'</div>'
			);

		qa_html_theme_base::logged_in();

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
		}
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
		$this->output('<body');
		$this->body_tags();
		$this->output('>');

		$this->body_script();
		$this->body_header();
		$this->body_submenu();
		
	/*added for different blue banner in different page*/	
		if ($this->template=='questions'){
			$this->body_banner();
		}

		if ($this->template=='ask'){
			$this->body_banner_ask();
		}

		if ($this->template=='tags'){
			$this->body_banner_tags();
		}

		if ($this->template=='users'){
			$this->body_banner_users();
		}		 
  	/*end of banner*/
		$this->body_content();
		$this->body_footer();
		$this->body_hidden();

		$this->output('</body>');
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
				
				<ul class="nav navbar-nav navbar-right" style = "">
					<li><a href="#" class = "border">Sign In</a></li>
					<li><a href="#" class = "border">Sign Up</a></li>
					<li><a href="#">Help</a></li>
					<li>
						<form class="navbar-form" role="search">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search Q & A" name="q">
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
		//$this->output('<div class="qam-login-bar"><div class="qam-login-group">');
		//$this->nav_user_search();
		//$this->output('</div></div>');
	}

	//adds submenu in the homepage
	public function body_submenu() {
		$this->output('<nav class="navbar navbar-default navbar-lower">
			<div class="container">

				<div id="navbar-lower" class="" aria-expanded="false" style="height: 1px;">

					<ul class="nav navbar-nav">
						<li><a href="./index.php?qa=questions">Questions</a></li>
						<li><a href="./index.php?qa=tags">Tags</a></li>
						<li><a href="./index.php?qa=users">Users</a></li>
						<li><a href="./index.php?qa=ask">Ask</a></li>
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>');
	//$this->nav('main');
	}
	
	public function body_banner() {
	
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
				<div class = "show-it">
					<button type="button" class = "btn signup-btn" id = "signup-btn">sign up</button>
				</div>
				<div class = "arrow"> <a href="#" id = "shrink-banner"><span class="glyphicon glyphicon-menu-down"></span> </a> </div>

			</div>
		</div>');
	}

	/*banner for ask page*/
	public function body_banner_ask() {
		$this->output('<div class = "blue-header">
		ask a question
	</div>');
	}

	/*banner for tags page*/
	public function body_banner_tags() {
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
	}

	/*banner for users page*/
	public function body_banner_users() {
		$this->output('<div class = "blue-header">
		users
	</div>');
	}
	
	
	public function body_content()
	{
		$this->body_prefix();
		$this->notices();

		$this->output('<div class="container"><div class="row"><div class="col-xs-9">', '');

		$this->widgets('full', 'top');
		$this->header();
		$this->widgets('full', 'high');
		
		$this->main();
		$this->output('</div>', '');
		$this->output('<div class="col-xs-3 side-bar">', '');
		$this->sidepanel();
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
		$this->nav('sub');
		//$this->header_clear();

		//$this->output('</div> <!-- END qa-header -->', '');
	}
	
	public function nav($navtype, $level=null)
	{
		$navigation = @$this->content['navigation'][$navtype];

		if ($navtype == 'user' || isset($navigation)) {
			$this->output('<div class="qa-nav-'.$navtype.'">');

			if ($navtype == 'user')
				$this->logged_in();

			// reverse order of 'opposite' items since they float right
			foreach (array_reverse($navigation, true) as $key => $navlink) {
				if (@$navlink['opposite']) {
					unset($navigation[$key]);
					$navigation[$key] = $navlink;
				}
			}

			$this->set_context('nav_type', $navtype);
			$this->nav_list($navigation, 'nav-'.$navtype, $level);
			$this->nav_clear($navtype);
			$this->clear_context('nav_type');

			$this->output('</div>');
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

		$this->output('<div class="qa-main'.(@$this->content['hidden'] ? ' qa-main-hidden' : '').'">');

		$this->widgets('main', 'top');

		$this->page_title_error();

		$this->widgets('main', 'high');

		$this->main_parts($content);

		$this->widgets('main', 'low');

		$this->page_links();
		$this->suggest_next();

		$this->widgets('main', 'bottom');

		$this->output('</div> <!-- END qa-main -->', '');
	}
	
	
	// removes sidebar for user profile pages
	public function sidepanel()
	{
		if ($this->template!='user')
			qa_html_theme_base::sidepanel();
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
		qa_html_theme_base::title();

		$feed=@$this->content['feed'];

		if (!empty($feed))
			$this->output('<a href="'.$feed['url'].'" title="'.@$feed['label'].'"><img src="'.$this->rooturl.'images/rss.jpg" alt="" width="16" height="16" border="0" class="qa-rss-icon"/></a>');
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

}