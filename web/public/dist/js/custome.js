function loginAuth(){
    var email = $('#email').val();
    var password = $('#password').val();
    var base_url = '{!! url() !!}';
    console.log(base_url);

    if(email == '' || password == ''){
        alert('Please fill all the fields');
    }else{
        $.ajax({
            url: `{{ route('login.auth') }}`,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
                email: email,
                password: password
            },
            success: function(data){
                if(data.status == 'success'){
                    window.location.href = `{{ route('dashboard.index') }}`;
                }else{
                    alert('Invalid username or password');
                }
            }
        });
    }
}