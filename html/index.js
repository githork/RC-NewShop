$(function () {
    function display(bool) {
        if (bool) {
            $("#shopMenu").show();
        } else {
            $("#shopMenu").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://rc-newshop/exit', JSON.stringify({}));
            return
        }
    };
    
    $("#close").click(function () {
        $.post('http://rc-newshop/exit', JSON.stringify({}));
        return
    })

    //ITEMS TRIGGER

    $("#slot1").click(function () {
        $.post('http://rc-newshop/buyBread', JSON.stringify({}));
        return
    })

    $("#slot2").click(function () {
        $.post('http://rc-newshop/buyWater', JSON.stringify({}));
        return
    })

    $("#slot3").click(function () {
        $.post('http://rc-newshop/buyIron', JSON.stringify({}));
        return
    })

    $("#slot4").click(function () {
        $.post('http://rc-newshop/buyPickAxe', JSON.stringify({}));
        return
    })

    $("#slot5").click(function () {
        $.post('http://rc-newshop/buyBag', JSON.stringify({}));
        return
    })

    $("#slot6").click(function () {
        $.post('http://rc-newshop/buyGold', JSON.stringify({}));
        return
    })

    $("#speicalSlot7").click(function () {
        $.post('http://rc-newshop/buyNumberplate', JSON.stringify({}));
        return
    })

    

    
    
    
})


