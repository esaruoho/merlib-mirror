//////////////////////////////////////////////////////////
//
// Explanation Window
//
// author: Franz-Josef Elmer, Nov. 2001
//
//////////////////////////////////////////////////////////
var links;  // array of links
var labels; // array of corresponding label texts
var layout; // HTML document with the frameset
var logo; // URL for the logo image
var ew; // window showing explanations
var naviContent; // HTML code for the navigation frame

// Defining content of explanation window
function defineContent() {
    layout = defineContent.arguments[0];
    logo = defineContent.arguments[1];

    n = defineContent.arguments.length;
    links = new Array(n / 2 - 1);
    labels = new Array(n / 2 - 1);
    index = 0;
    document.writeln("<table border=\"0\" cellspacing=\"15\" cellpadding=\"5\">");
    document.writeln("<tr>");
    naviContent = "<html><body bgcolor=\"#e0e0e0\" text=\"#000000\" "
                   + "link=\"#800000\" vlink=\"#800000\" alink=\"#FF00FF\">"
                   + "<table border=\"0\" cellpadding=\"1\" cellspacing=\"3\">"
                   + "<tr><td><img src=\"" + logo + "\"></td>";
    for (i = 2; i < n; i += 2) {
        links[index] = defineContent.arguments[i];
        labels[index] = defineContent.arguments[i + 1];
        document.write("  <td bgcolor=\"#d0e0f0\"><a href=\"javascript:show('");
        document.write(index + "')\">" + labels[index] + "</a><a href=\"");
        document.writeln(links[index] + "\"></a></td>");
        naviContent += "<td>&nbsp;<a href=\"" + links[index] + "\" "
                       + "target=\"content\">" + labels[index] + "</a>&nbsp;</td>";
        index++;
    }
    document.writeln("</tr></table>");
    naviContent += "</tr></table></body></html>";
}

// Showing explanation window with given link
function show(linkIndex) {
    if (!ew || ew.closed) {
        ew = window.open(layout, "explanationWindow",
                         "width=600,height=250,scrollbars=yes,resizable=yes,dependent=yes,menubar=no,locationbar=yes");
    }
    setTimeout("ew.top.navigation.document.close()", 500);
    ew.top.navigation.document.open();
    ew.top.navigation.document.write(naviContent);
    ew.top.navigation.document.close();
    ew.top.content.location.href = links[linkIndex];
    ew.top.content.focus();
}

// Closing explanation window
function close() {
    if (ew) {
        ew.close();
    }
}

