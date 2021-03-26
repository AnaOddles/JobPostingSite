<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use App\services\data\Utility\MyLogger3;

use Illuminate\Auth\AuthenticationException;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    protected function redirectTo($request)
    {
        $logger = new MyLogger3();
        $logger->info("In Auth Middleware - could not authenciate user for route: " . $request->path());
        if (! $request->expectsJson()) {
            return route('login');
        }
    } 
    
    /**
     * Determine if the user is logged in to any of the given guards.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  array  $guards
     * @return void
     *
     * @throws \Illuminate\Auth\AuthenticationException
     */
    protected function authenticate($request, array $guards)
    {
        if (empty($guards)) {
            $guards = [null];
        }
        
        foreach ($guards as $guard) {
            if ($this->auth->guard($guard)->check()) {
                $logger = new MyLogger3();
                $logger->info("In Auth Middleware - user authenticated for route: " . $request->path());               
                return $this->auth->shouldUse($guard);
            }
        }
        
        throw new AuthenticationException(
            'Unauthenticated.', $guards, $this->redirectTo($request)
            );
    }
}
