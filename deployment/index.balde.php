@extends('layouts.app') 

@section('content')
<div class="container">
	<div class="row">
		<div class="col-3 p-5">
		</div>
		<div class="col-12 pb-5">
			<div class="d-flex justify-content-between align-items-baseline">
				<h1>{{$user->name}}</h1>
				@php
					$image = $user->profile->profileImage();
					// set session variable for user id
					session_start();
    				$_SESSION['userid'] = $user->id;
				@endphp
				<img src="{{asset('profile_pics')}}/{{$image}}" class ="rounded-circle w-25">
			</div>
			<!-- Using polocy and authorization to hide the edit profile if user is not logged in  -->
			@can('update', $user->profile)
				<a href="{{ route('profile.edit', ['user' => $user->id]) }}">Edit Profile</a>
			@endcan
			<br/>
				<a href="{{ route('portfolio.show', ['user' => $user->id]) }}">View Portfolio</a>
			
			<div class="pt-4 pb-4 font-weight-bold">
			{{$user->profile->headline}}
			
			</div> 
			<div class="pt-4 pb-4 font-weight-bold">
				<label for="contact" class="col-form-label">Contact:</label>
				
			</div>
			<div>{{$user->email}}</div> 
			<hr>
			
			<div class="pt-4 pb-4 font-weight-bold">
				<label for="about" class="col-form-label">About:</label>
				
			</div>
			<div>{{$user->profile->about}}</div> 
			<hr>
			
			<div class="pt-4 pb-4 font-weight-bold">
				<label for="location" class="col-form-label">Location:</label>
			</div>
			<div>{{$user->profile->location}}</div>
			<hr>
			
<!-- 			<div class="pt-4 pb-4 font-weight-bold"> -->
<!-- 				<label for="education" class="col-form-label">Education:</label> -->
<!-- 			</div> -->
<!-- 			<div>{{$user->profile->education}}</div> -->
<!-- 			<hr> -->
			 
<!-- 			<div class="pt-4 pb-4 font-weight-bold"> -->
<!-- 				<label for="licenseAndCertification" class="col-form-label">License And Certifications:</label> -->
<!-- 			</div> -->
<!-- 			<div>{{$user->profile->licenseAndCertifications}}</div> -->
<!-- 			<hr> -->
			
<!-- 			<div class="pt-4 pb-4 font-weight-bold"> -->
<!-- 				<label for="skills" class="col-form-label">Skills:</label> -->
<!-- 			</div> -->
<!-- 			<div>{{$user->profile->skills}}</div> -->
<!-- 			<hr> -->
			
			
<!-- 			<div class="pt-4 pb-4 font-weight-bold"> -->
<!-- 				<label for="experience" class="col-form-label">Experience:</label> -->
<!-- 			</div> -->
<!-- 			<div>{{$user->profile->experience}}</div> -->
<!-- 			<hr> -->
			
		</div>
	</div>
	<div class="row pt-5 pb-4 ">
	</div>
</div>
@endsection
