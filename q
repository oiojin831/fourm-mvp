
[1mFrom:[0m /home/nyuno/fourm-mvp/app/controllers/sessions_controller.rb @ line 33 SessionsController#callback:

    [1;34m23[0m: [32mdef[0m [1;34mcallback[0m
    [1;34m24[0m:   [1;34m# if the user denied authorization[0m
    [1;34m25[0m:   [32mif[0m params[[33m:error[0m]
    [1;34m26[0m:     [1;34m# do something[0m
    [1;34m27[0m:     redirect_to root_path
    [1;34m28[0m:   [32melse[0m
    [1;34m29[0m:     _response = [1;34;4mInstagram[0m.get_access_token(params[[33m:code[0m], [35mredirect_uri[0m: [1;34;4mCALLBACK_URL[0m)
    [1;34m30[0m:     _client = [1;34;4mInstagram[0m.client([35maccess_token[0m: _response.access_token)
    [1;34m31[0m:     binding.pry
    [1;34m32[0m:     [1;34m# create store[0m
 => [1;34m33[0m:     session[[33m:access_token[0m] = request.env[[31m[1;31m'[0m[31momniauth.auth[1;31m'[0m[31m[0m].credentials.token
    [1;34m34[0m:     worker =[1;34;4mInstaWorker[0m.new([35muser_info[0m: request.env[[31m[1;31m'[0m[31momniauth.auth[1;31m'[0m[31m[0m])
    [1;34m35[0m: 
    [1;34m36[0m:     [32mif[0m worker.save
    [1;34m37[0m:       redirect_to store_path(worker.store_id)
    [1;34m38[0m:     [32melse[0m
    [1;34m39[0m:       redirect_to store_path([1;34;4mStore[0m.find_by([35musername[0m: params[[33m:search[0m]))
    [1;34m40[0m:     [32mend[0m
    [1;34m41[0m:   [32mend[0m
    [1;34m42[0m: [32mend[0m

