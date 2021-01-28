$(function () {


    $('#newCustomerForm').submit(ajaxSubmit);
    $('#customerFormPrijava').submit(ajaxLogin);
    provjeriLogin();

    $('#userSearch').keypress(function (event) {
        if (event.which === 13) {
            var query = $('#userSearch').val();
            search(query);
        }
    })

    $('#userSearchRepo').keypress(function (event) {
        if (event.which === 13) {
            var query = $('#userSearchRepo').val();
            searchRepo(query);
        }
    })

})

function ajaxSubmit() {
    var newCustomerFormSer = $(this).serialize();
    var newCustomerForm = $(this).serializeArray(),
        dataObj = {};
    $(newCustomerForm).each(function (i, field) {
        dataObj[field.name] = field.value;
    });
    for (const prop in dataObj) {
        if (dataObj[prop] == "" || dataObj[prop] == null || dataObj[prop] == undefined) {
            alert("Niste unijeli sva polja!");
            return false;
        }
    }
    var pass1, pass2;
    newCustomerForm.forEach(element => {
        switch (element.name) {
            case "password":
                pass1 = element.value;
                break;
            case "password2":
                pass2 = element.value;
                break;
        }
    });
    if (pass1 != pass2) {
        alert("Lozinke se ne poklapaju!");
        return false;
    } else {
        if (pass1.length < 6) {
            alert("Duljina lozinke mora biti veća od 6 znakova!");
            return false;
        } else {
            //sva polja validirana
            $.ajax({
                type: 'POST',
                url: my_ajax_object.ajax_url,
                data: newCustomerFormSer,
                success: function (data) {
                    Swal.fire(
                        'Obrisano!',
                        'Uspješno ste registrirani!',
                        'success'
                    )
                    $(window).attr('location', 'http://localhost/wordpress/prijava/');
                }
            });
        }
    }
    return false;
}

function ajaxLogin() {
    var loginForm = $(this).serialize();
    $.ajax({
        type: 'POST',
        url: my_ajax_object.ajax_url,
        data: loginForm,
        success: function (data) {
            var dataObj = JSON.parse(data);
            if (dataObj == null) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Pogrešni podaci',
                })
                return false;
            } else {
                provjeriLogin();
                $(window).attr('location', 'http://localhost/wordpress/profil/');
                Swal.fire({
                    icon: 'success',
                    title: 'Uspjeh!',
                    text: 'Dobrodošli!'
                })
            }

        }
    })
    return false;
}

function provjeriLogin() {
    $.ajax({
        type: 'POST',
        url: my_ajax_object.ajax_url,
        data: {
            action: 'vrati_sessionId'
        },
        success: function (data) {
            //console.log(data); //ne razumijem zašto mi stavlja 0 na kraj json-a??????????????????????????
            if (data.length > 1) {
                //prijavljen
                var cldata = data.substring(0, data.length - 1); //privremeno rješenje, todo-> otkri odakle 0 
                var dataObj = JSON.parse(cldata);
                $('#user-name').html(dataObj.user_name);
                $('#profile').css('display', 'block');
                $('#profile').html('<a href="http://localhost/wordpress/profil/"><i class="far fa-id-badge" style="padding-right:10px; margin-top:-10px;"></i>Profil</a><br>')
                $('#user-links').html('<a href="" onclick="ajaxLogout()"><i class="fas fa-sign-out-alt" style="padding-right:5px;"></i>Odjavi se</a>');
            } else {
                //nije
                $('#user-links').html('<a href="http://localhost/wordpress/prijava/"><i class="fas fa-sign-in-alt" style="padding-right:5px;"></i>Prijava</a>');
                $('#profile').css('display', 'none');
                $('#user-name').html("Niste prijavljeni.");
            }
        },
        error: function (err) {
            alert(err);
        }
    })
}

function ajaxLogout() {
    $.ajax({
        type: 'POST',
        url: my_ajax_object.ajax_url,
        data: {
            action: 'odjavi_korisnika'
        },
        success: function (data) {
            $(window).attr('location', 'http://localhost/wordpress/');
        }
    })
}

function dodajKosaricu(knjiga_id) {
    $.ajax({
        type: 'POST',
        url: my_ajax_object.ajax_url,
        data: {
            action: 'dodaj_u_kosaricu',
            knjiga_id: knjiga_id
        },
        success: function (data) {
            if (data != 0) {
                Swal.fire(
                    'Uspjeh!',
                    'Knjiga uspješno dodana u košaricu.',
                    'success'
                )
            } else {
                alert("Knjiga već u košarici");
            }
            console.log(data);
        }
    })

}

function makni_izKosarice(knjiga_id, ids) {
    Swal.fire({
        title: 'Jeste li sigurni?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Obriši!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Obrisano!',
                'Knjiga je uspješno obrisana',
                'success'
            )
            $('#' + knjiga_id).addClass('list-group-item-danger');
            $('#' + knjiga_id).fadeOut("slow", function () {
                $('#' + knjiga_id).remove();
                $.ajax({
                    type: 'post',
                    url: my_ajax_object.ajax_url,
                    data: {
                        action: 'makni_iz_kosarice',
                        knjiga_id: knjiga_id
                    },
                    success: function (data) {
                        popIdKnjige(knjiga_id, ids); //makni iz arraya knjiga jer inače će se posuditi ništa ako se svejedno klikne na posudi
                    }
                })
            });
        }
    })


}

function vratiKnjigu(knjiga_id) {
    const redakKnjige = $('#' + knjiga_id);
    $.ajax({
        type: 'post',
        url: my_ajax_object.ajax_url,
        data: {
            action: 'promijeni_status_knjige',
            knjiga_id: knjiga_id
        },
        success: function (data) {
            console.log(data);
            Swal.fire(
                'Obrisano!',
                'Knjiga je uspješno vraćena!',
                'success'
            )
            redakKnjige.remove();
        }
    })
}

function popIdKnjige(id, ids) {
    for (var i = 0; i < ids.length; i++) {
        if (ids[i] == id) {
            ids.splice(i, 1); //splice at (index, # of elements)
        }
    }
    console.log(ids);
}

function dovrsiNarudzbu(ids) {
    if (ids.length > 0) {
        $.ajax({
            type: 'post',
            url: my_ajax_object.ajax_url,
            data: {
                action: 'dovrsi_narudzbu',
                ids: ids
            },
            success: function (data) {
                Swal.fire(
                    'Uspjeh!',
                    'Knjige su uspješno posuđene!',
                    'success'
                )
                $(window).attr('location', 'http://localhost/wordpress/profil');
            }
        })
    } else {
        alert("Košarica je prazna.");
    }
}

function search(search_string) {
    const node = $('.books-div');
    node.empty();
    node.append('<div class="spinner-border" role="status"><span class="sr-only">Učitavam....</span></div>');
    $.ajax({
        type: 'post',
        url: my_ajax_object.ajax_url,
        dataType: 'html',
        data: {
            action: 'arhiva_search',
            query: search_string
        },
        success: function (data) {
            var cldata = data.substring(0, data.length - 1);
            node.append(cldata);
        },
        complete: function () {
            $('.spinner-border').hide();
        }
    })
}

function searchRepo(search_string) {
    const node = $('.repo-holder');
    node.empty();
    node.append('<div class="spinner-border" role="status"><span class="sr-only">Učitavam....</span></div>');
    $.ajax({
        type: 'post',
        url: my_ajax_object.ajax_url,
        dataType: 'html',
        data: {
            action: 'repo_search',
            query: search_string
        },
        success: function (data) {
            var cldata = data.substring(0, data.length - 1);
            node.append(cldata);
        },
        complete: function () {
            $('.spinner-border').hide();
        }
    })
}
