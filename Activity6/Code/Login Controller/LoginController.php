<?php
/*
 * Name: Mann Jaiswal, Kacey Morris, Ana Sanchez
 * Php 3 Laravel
 * All work is our as influenced  by in class lecture
 */
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\services\data\Utility\ILoggerService;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    //Uses all business logic of AuthenticatesUsers obj
    //including validations
    use AuthenticatesUsers;

    protected $logger; 
    
    public function __construct(ILoggerService $logger)
    {
        $this->logger = $logger;
        $this->middleware('guest')->except('logout');
    }
    //redirects the user to their profile on login 
    protected function redirectTo(){
       return "/profiles/" . auth()->user()->id;
    }
    
    //shows the loginform
    protected function showLoginForm()
    {
        //Log for the user reaching login form using the logging service provider        
        $this->logger->info("Entering LoginController::showLoginForm()");
        return view('auth.login');
    }
   
    //redirects the user to logout once loged out
    protected function logout(Request $request) {
        $this->logger->info("Entering LoginController::logout()... logging user out");
        //Log::info("Entering LoginController::logout()... logging user out");
        Auth::logout();
        return redirect('/login');
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    
    /**
     * Get the needed authorization credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(Request $request)
    {
        //Log the user credentials for login attempt
        $credentials = array();
        $credentials[] = $request->get('email');
        $credentials[] = $request->get('password');
        
        $this->logger->info("Login credentials are: ", $credentials);
        return $request->only($this->username(), 'password');
    }
    
    

    
    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    protected function login(Request $request)
    {
        $this->validateLogin($request);
        
        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        
       
  
        
        if (method_exists($this, 'hasTooManyLoginAttempts') &&
            $this->hasTooManyLoginAttempts($request)) {
                $this->fireLockoutEvent($request);
                //Log::info("Exit LoginController::index() with login failing!");
                $this->logger->info("Exit LoginController::login() with login failing!");
                return $this->sendLockoutResponse($request);
            }
            
            if ($this->attemptLogin($request)) {
                //Log::info("Exit LoginController::index() with login passing!");
                $this->logger->info("Exit LoginController::login() with login passing!");   
                return $this->sendLoginResponse($request);
            }
            
            // If the login attempt was unsuccessful we will increment the number of attempts
            // to login and redirect the user back to the login form. Of course, when this
            // user surpasses their maximum number of attempts they will get locked out.
            $this->incrementLoginAttempts($request);
            //Log::info("Exit LoginController::index() with login failing!");
            $this->logger->info("Exit LoginController::login() with login failing!");    
            return $this->sendFailedLoginResponse($request);
    }
}
