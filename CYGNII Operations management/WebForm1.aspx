<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CYGNII_Operations_management.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        mobiscroll.setOptions({
            theme: 'ios',
            themeVariant: 'light',
            clickToCreate: true,
            dragToCreate: true,
            dragToMove: true,
            dragToResize: true,
            eventDelete: true
        });

        $(function () {

            var inst = $('#demo-desktop-week-view').mobiscroll().eventcalendar({
                view: {
                    schedule: { type: 'week' }
                },
                onEventClick: function (event, inst) {
                    mobiscroll.toast({
                        message: event.event.title
                    });
                }
            }).mobiscroll('getInst');

            $.getJSON('https://trial.mobiscroll.com/events/?vers=5&callback=?', function (events) {
                inst.setEvents(events);
            }, 'jsonp');

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div id="demo-desktop-week-view"></div>
    </form>
</body>
</html>
