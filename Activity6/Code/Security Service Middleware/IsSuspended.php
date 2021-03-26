<?php

namespace App\Http\Middleware;

use App\services\data\Utility\MyLogger3;
use Closure;

class IsSuspended
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $logger = new MyLogger3();
        
        //If the user is logged in and suspended
        if(auth()->check() && auth()->user()->isSuspended()) {
            $logger->info("In isSuspended Middleware - user suspended. Can not access: " . $request->path());
            //else return home and logout
            auth()->logout();
            $message = 'Your account has been suspended. Please contact administrator.';
            //send a message along with the refirect to the login page
            return redirect('login')->withMessage($message);
           
        }
        $logger->info("In isSuspended Middleware - user not suspended. Can access: " . $request->path());
        
        //take to next request - which is admin page
        return $next($request);
    }
}
