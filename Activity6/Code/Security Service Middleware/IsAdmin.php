<?php

namespace App\Http\Middleware;

use Closure;
use App\services\data\Utility\MyLogger3;

class IsAdmin
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
        //IF the user is an admin
        if(auth()->user()->isAdmin()) {
            $logger->info("In isAdmin Middleware - user authenticated for admin route: " . $request->path());
            //take to next request - which is admin page
            return $next($request);
        }
        $logger->info("In isAdmin Middleware - could not authenciate user for admin route: " . $request->path());
        
        //else return home 
        return redirect('home');
    }
}
