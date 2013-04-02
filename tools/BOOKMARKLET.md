Instructions
========================
 
1. Add a new bookmarklet with the below javascript as the URL.
2. Run 'ruby ./server.rb' - this will serve the 'stripe-webhook-updater.js' file locally with a self-signed SSL certificate
3. Visit 'https://manage.stripe.com/account/webhooks' and click 'Test Webooks'
4. Click/run your bookmarklet. You should see a list of links appear in modal dialogue. Click each one to download.


Bookmarklet code
==================

    javascript:(function(e,a,g,h,f,c,b,d)%7Bif(!(f%3De.jQuery)%7C%7Cg>f.fn.jquery%7C%7Ch(f))%7Bc%3Da.createElement("script")%3Bc.type%3D"text/javascript"%3Bc.src%3D"http://ajax.googleapis.com/ajax/libs/jquery/"%2Bg%2B"/jquery.min.js"%3Bc.onload%3Dc.onreadystatechange%3Dfunction()%7Bif(!b%26%26(!(d%3Dthis.readyState)%7C%7Cd%3D%3D"loaded"%7C%7Cd%3D%3D"complete"))%7Bh((f%3De.jQuery).noConflict(1),b%3D1)%3Bf(c).remove()%7D%7D%3Ba.documentElement.childNodes%5B0%5D.appendChild(c)%7D%7D)(window,document,"1.3.2",function(%24,L)%7Bjavascript: (function () %7B       var jsCode %3D document.createElement(%27script%27)%3B       jsCode.setAttribute(%27src%27, %27https://localhost:2000/stripe-webhook-updater.js%27)%3B                      document.body.appendChild(jsCode)%3B    %7D())%3B %7D)%3B
