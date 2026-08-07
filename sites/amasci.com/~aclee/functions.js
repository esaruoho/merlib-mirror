function makeArray(len) {
   for (var i=0; i<len; i++) this[i]=null;
this.length=len;
}
var logos = new makeArray(100);
   logos[0] = "<img src='splash1.JPG'>";
   logos[1] = "<img src='splash2.JPG'>";
   logos[2] = "<img src='splash3.JPG'>";
   logos[3] = "<img src='splash4.JPG'>";
   logos[4] = "<img src='splash5.JPG'>";
   logos[5] = "<img src='splash6.JPG'>";
   logos[6] = "<img src='splash7.JPG'>";
   logos[7] = "<img src='splash8.JPG'>";
   logos[8] = "<img src='splash9.JPG'>";
   logos[9] = "<img src='splash10.JPG'>";
   logos[10] = "<img src='splash11.JPG'>";
   logos[11] = "<img src='splash12.JPG'>";
   logos[12] = "<img src='splash13.JPG'>";
   logos[13] = "<img src='splash14.JPG'>";
   logos[14] = "<img src='splash15.JPG'>";
   logos[15] = "<img src='splash16.JPG'>";
   logos[16] = "<img src='splash17.JPG'>";
   logos[17] = "<img src='splash18.JPG'>";
   logos[18] = "<img src='splash19.JPG'>";
   logos[19] = "<img src='splash20.JPG'>";
   logos[20] = "<img src='splash21.JPG'>";
   logos[21] = "<img src='splash22.JPG'>";
   logos[22] = "<img src='splash23.JPG'>";
   logos[23] = "<img src='splash24.JPG'>";
   logos[24] = "<img src='splash25.JPG'>";
   logos[25] = "<img src='splash26.JPG'>";
   logos[26] = "<img src='splash27.JPG'>";   
   logos[27] = "<img src='splash28.JPG'>";
   logos[28] = "<img src='splash29.JPG'>";
   logos[29] = "<img src='splash30.JPG'>";   
   logos[30] = "<img src='splash31.JPG'>";
   logos[31] = "<img src='splash32.JPG'>";
   logos[32] = "<img src='splash33.JPG'>";
   logos[33] = "<img src='splash34.JPG'>";
   logos[34] = "<img src='splash35.JPG'>";
   logos[35] = "<img src='splash36.JPG'>";
   logos[36] = "<img src='splash37.JPG'>";
   logos[37] = "<img src='splash38.JPG'>";
   logos[38] = "<img src='splash39.JPG'>";
   logos[39] = "<img src='splash40.JPG'>";
   logos[40] = "<img src='splash41.JPG'>";
   logos[41] = "<img src='splash42.JPG'>";
   logos[42] = "<img src='splash43.JPG'>";
   logos[43] = "<img src='splash44.JPG'>";
   logos[44] = "<img src='splash45.JPG'>";
   logos[45] = "<img src='splash46.JPG'>";
   logos[46] = "<img src='splash47.JPG'>";
   logos[47] = "<img src='splash48.JPG'>";
   logos[48] = "<img src='splash49.JPG'>";
   logos[49] = "<img src='splash50.JPG'>";
   logos[50] = "<img src='splash51.JPG'>";
   logos[51] = "<img src='splash52.JPG'>";
   logos[52] = "<img src='splash53.JPG'>";
   logos[53] = "<img src='splash54.JPG'>";
   logos[54] = "<img src='splash55.JPG'>";
   logos[55] = "<img src='splash56.JPG'>";
   logos[56] = "<img src='splash57.JPG'>";
   logos[57] = "<img src='splash58.JPG'>";
   logos[58] = "<img src='splash59.JPG'>";
   logos[59] = "<img src='splash60.JPG'>";
   logos[60] = "<img src='splash61.JPG'>";
   logos[61] = "<img src='splash62.JPG'>";
   logos[62] = "<img src='splash63.JPG'>";
   logos[63] = "<img src='splash64.JPG'>";
   logos[64] = "<img src='splash65.JPG'>";
   logos[65] = "<img src='splash66.JPG'>";
   logos[66] = "<img src='splash67.JPG'>";
   logos[67] = "<img src='splash68.JPG'>";
   logos[68] = "<img src='splash69.JPG'>";
   logos[69] = "<img src='splash70.JPG'>";
   logos[70] = "<img src='splash71.JPG'>";
   logos[71] = "<img src='splash72.JPG'>";
   logos[72] = "<img src='splash73.JPG'>";
   logos[73] = "<img src='splash74.JPG'>";
   logos[74] = "<img src='splash75.JPG'>";
   logos[75] = "<img src='splash76.JPG'>";
   logos[76] = "<img src='splash77.JPG'>";
   logos[77] = "<img src='splash78.JPG'>";
   logos[78] = "<img src='splash79.JPG'>";
   logos[79] = "<img src='splash80.JPG'>";
   logos[80] = "<img src='splash81.JPG'>";
   logos[81] = "<img src='splash82.JPG'>";
   logos[82] = "<img src='splash83.JPG'>";
   logos[83] = "<img src='splash84.JPG'>";
   logos[84] = "<img src='splash85.JPG'>";
   logos[85] = "<img src='splash86.JPG'>";
   logos[86] = "<img src='splash87.JPG'>";
   logos[87] = "<img src='splash88.JPG'>";
   logos[88] = "<img src='splash89.JPG'>";
   logos[89] = "<img src='splash90.JPG'>";
   logos[90] = "<img src='splash91.JPG'>";
   logos[91] = "<img src='splash92.JPG'>";
   logos[92] = "<img src='splash93.JPG'>";
   logos[93] = "<img src='splash94.JPG'>";
   logos[94] = "<img src='splash95.JPG'>";
   logos[95] = "<img src='splash96.JPG'>";
   logos[96] = "<img src='splash97.JPG'>";
   logos[97] = "<img src='splash98.JPG'>";
   logos[98] = "<img src='splash99.JPG'>";
   logos[99] = "<img src='splash100.JPG'>";

function rand(n) {
   seed = ( 0x015a4e35 * seed) % 0x7fffffff;
   return (seed >> 16) % n;
}

function MapAccessSequim()
{
        var accesscode=prompt("Enter access code.  Don't forget your code is case-sensitive.","")
        switch(accesscode) {
                case "scooby":
                        window.location="maps/sequim.html"
                        break;
                case "282":
                        window.location="maps/sequim.html"
                        break;
                default:
                        alert("Sorry, you didn't enter a valid code.")
                        break;
                }
}

function MapAccessSeattle()
{
        var accesscode=prompt("Enter access code.  Don't forget your code is case-sensitive.","")
        switch(accesscode) {
                case "kiki":
                        window.location="maps/seattle.html"
                        break;
                case "2502":
                        window.location="maps/seattle.html"
                        break;
                default:
                        alert("Sorry, you didn't enter a valid code.")
                        break;
                }
}


function PhotoAccess()
{
        var accesscode=prompt("Enter access code.  Don't forget your code is case-sensitive.","")
        switch(accesscode) {
                case "ada":
                        window.location="photos/toc.html"
                        break;
                case "grace":
                        window.location="photos/toc.html"
                        break;
                default:
                        alert("Sorry, you didn't enter a valid code.")
                        break;
                }
}

var now = new Date()
var seed = now.getTime() % 0xffffffff


