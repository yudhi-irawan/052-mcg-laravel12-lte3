<?php
	// File name   : 015_lte3_sidebar_details.blade.php
	// Last Edited : 2026-03-27


	// MCG - Massive CRUD Generator Laravel-AdminLTE3-PostgreSQL for Laravel 10 Up ver. Jan 2026-Free Version

	// Private message at Telegram        : @yudhi_irawan
	// Private activity feeds at Instagram: @iam.yudhi_irawan

	// Download Massive CRUD Generator on telegram and github link
	// MCG Application: https://t.me/MCGFreeVersion
	// Documentation  : https://yudhi-irawan.github.io/200-mcg-documentation/tutorial.html
	// Testing        : https://github.com/yudhi-irawan/052-mcg-laravel12-lte3
	// Template       : 

	// Donation and Support link
	// Ko-fi   : https://ko-fi.com/MassiveCrudGenerator
	// Trakteer: https://trakteer.id/MassiveCrudGenerator

	// Please follow us for information about new releases


?>

<li class="nav-item">
	<a id="dashboard" href="/" class="nav-link">
		<i class="nav-icon fas fa-tachometer-alt"></i>
		<p>DASHBOARD</p>
	</a>
</li>
<li class="nav-item">
	<a id="sex" href="/sex" class="nav-link">
		<i class="nav-icon fas fa-edit text-info"></i>
		<p>Tabel Sex</p>
	</a>
</li>
<li class="nav-item">
	<a id="edu" href="/edu" class="nav-link">
		<i class="nav-icon fas fa-edit text-info"></i>
		<p>Table Education Level</p>
	</a>
</li>
<li class="nav-item">
	<a id="emp" href="/employee" class="nav-link">
		<i class="nav-icon fas fa-edit text-info"></i>
		<p>Employee</p>
	</a>
</li>
@include('layouts.015_lte3_logout')
