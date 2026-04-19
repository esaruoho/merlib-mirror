
import java.applet.*;
import java.awt.*;
import java.awt.event.*;

//----------------------------------------------------------

public class RaumwirbelP6P1 extends Applet implements ActionListener, Runnable
{
  int width = 700, totalWidth, height;         // Abmessungen
  Graphics g1, g2;
  Image offscreen;
  Color bgColor = Color.white;                  // Hintergrundfarbe Grafikbereich
  Color pColor = new Color(200,200,200);        // Farbe Hintergrund Formular
  Color sColor = Color.black;                   // Schriftfarbe
  Color xColor = Color.red;                     // Farbe X-Achse
  Color yColor = new Color(0,128,0);            // Farbe Y-Achse
  Color zColor = Color.blue;                    // Farbe Z-Achse
  Color a1Color = Color.black;                  // 4 Farben KurveA
  Color a2Color = Color.black;
  Color a3Color = Color.red;
  Color a4Color = Color.red;
  Color b1Color = Color.magenta;                // 4 Farben KurveB
  Color b2Color = Color.magenta;
  Color b3Color = Color.blue;
  Color b4Color = Color.blue;
  Font fSS;                                     // Zeichensatz
  Panel p;
  Checkbox cbA, cbB, cbC, cbR;                           // Schalter
  Button bPause;
  Label lhfakt, lvN, lstarth, lkipp, lbvk, lneun, lneunB, lkreist, lphas1, lphas2, lianz,lEins;
  TextField tfvN, tfneun, tfneunB, tfhfakt, tfstarth, tfTheta, tfEins;
  TextField tfbvk, tfkreist, tfphas1, tfphas2, tfianz;
  Thread thr;
  double t;                                    // Zeit (s)
  boolean on, nordhalbkugel=true;                                  // Flag für Bewegung
  final double omega = Math.PI/128;            // Winkelgeschwindigkeit (1/s)
  final double PI=Math.PI, zPI=2*PI, fiGold=(Math.sqrt(5)+1.0)/2.0;
  int u0, v0, ianz,AnzahlKreise;                    // Ursprung
  double theta;                                // Winkel bezüglich x-y-Ebene
  double phi;                                  // Winkel bezüglich x-Achse
  double a1, a2, b1, b2, b3, c1, c2, c3;       // Koeffizienten für Projektion
  double vR, kreisteile, bvk, vN, hfakt, starth;   // Torusgrößen R,r, Windg., Kreisteile
  double neun, neunB, phas1, phas2, Eins;
  final int max = 1000;                        // Maximalwert für Koordinaten

  String KA,KB;
  String lang;                                 // Sprache (Parameter aus Applet-Tag)
  String[] text;
  String[] german = { "Raum-Spirale konstanter Krümmung","" , "", "Stop / Weiter", "",
  "Daten speichern im HTM-Code","Download www.webstickers.de","© G.Mueller 2004, © W.Fendt 1998" };
//um z-achse,um Schlauch

//----------------------------------------------------------

 // Komponente zum Panel hinzufügen:
  // comp .... Komponente
  // color ... Hintergrundfarbe
  // x ....... Spalte
  // y ....... Zeile
  // w ....... Breite
  // top usw.. Abstände zu den benachbarten Komponenten

  void addComponent (Component comp, Color color, int x, int y, int w,
    int top, int left, int bottom, int right)
  {
    GridBagConstraints c = new GridBagConstraints();
    c.gridx = x; c.gridy = y; c.gridwidth = w; c.gridheight = 1;
    c.fill = GridBagConstraints.HORIZONTAL;
    c.anchor = GridBagConstraints.CENTER;
    c.weightx = 1; c.weighty = 1;
    c.insets = new Insets(top,left,bottom,right);
    ((GridBagLayout)p.getLayout()).setConstraints(comp,c);
    comp.setFont(fSS); comp.setBackground(color);
    p.add(comp);
  }





//----------------------------------------------------------

  public void init()
  {
    int i, j;
    totalWidth = getSize().width;
    height = getSize().height;

    g1 = getGraphics();
    offscreen = createImage(width,height);
    g2 = offscreen.getGraphics();
    fSS = new Font("SansSerif",Font.BOLD,12);
    setLayout(new BorderLayout());
    u0 = (int)(width/(2.2)); v0 = height/2;
  }

//----------------------------------------------------------

 // Starten der Animation:

  public void start ()
  {

    String s, kt="360";
    double wink=30.0;
    text = german;
    lang = getParameter("language");
    if (lang == null) lang = "German";

    p = new Panel();
    p.setLayout(new GridBagLayout());
    p.setBackground(pColor);
    addComponent(new Label(text[0]),pColor,0,0,0,30,10,0,10);

    lianz = new Label("Spiralenzahl"); lianz.setForeground(Color.black);
    addComponent(lianz,pColor,0,1,1,0,10,0,0);

      tfianz = new TextField(4); tfianz.setText("3");
      addComponent(tfianz,Color.white,1,1,1,0,0,0,20);

    lvN = new Label("Windungen"); lvN.setForeground(Color.black);
    addComponent(lvN,pColor,0,2,1,0,10,0,0);

      tfvN = new TextField(8); tfvN.setText("4");
      addComponent(tfvN,Color.white,1,2,1,0,0,0,20);

    lneun = new Label("Faktor a"); lneun.setForeground(Color.black);
    addComponent(lneun,pColor,0,3,1,0,10,0,0);

      tfneun = new TextField(4); tfneun.setText("1");
      addComponent(tfneun,Color.white,1,3,1,0,0,0,20);

    lneun = new Label("Faktor b"); lneun.setForeground(Color.black);
    addComponent(lneun,pColor,0,4,1,0,10,0,0);

      tfneunB = new TextField(4); tfneunB.setText("1");
      addComponent(tfneunB,Color.white,1,4,1,0,0,0,20);

    lEins = new Label("Eins in k"); lEins.setForeground(Color.black);
    addComponent(lEins,pColor,0,5,1,0,10,0,0);

      tfEins = new TextField(4); tfEins.setText("1");
      addComponent(tfEins,Color.white,1,5,1,0,0,0,20);

    lphas2 = new Label("Verdrehwinkel"); lphas2.setForeground(Color.black);
    addComponent(lphas2,pColor,0,6,1,0,10,0,0);

      tfphas2 = new TextField(4); tfphas2.setText("30");
      addComponent(tfphas2,Color.white,1,6,1,0,0,0,20);

    lhfakt = new Label("Höhenfaktor"); lhfakt.setForeground(Color.black);
    addComponent(lhfakt,pColor,0,7,1,0,10,0,0);

      tfhfakt = new TextField(4); tfhfakt.setText("2.35");
      addComponent(tfhfakt,Color.white,1,7,1,0,0,0,20);

    lstarth = new Label("Starthöhe KurveA"); lstarth.setForeground(Color.black);
    addComponent(lstarth,pColor,0,8,1,0,10,0,0);

      tfstarth = new TextField(8); tfstarth.setText("0");
      addComponent(tfstarth,Color.white,1,8,1,0,0,0,20);

    lkreist = new Label("Schritte pro Umlauf"); lkreist.setForeground(Color.black);
    addComponent(lkreist,pColor,0,9,1,0,10,0,0);

      tfkreist = new TextField(8); tfkreist.setText("500");
      addComponent(tfkreist,Color.white,1,9,1,0,0,0,20);

    lkipp = new Label("Kipp-Winkel (Grad)"); lkipp.setForeground(Color.black);
    addComponent(lkipp,pColor,0,10,1,0,10,0,0);

      tfTheta = new TextField(4); tfTheta.setText("30");
      addComponent(tfTheta,Color.white,1,10,1,0,0,0,20);

    lphas1 = new Label("Winkel X-Achse"); lphas1.setForeground(Color.black);
	addComponent(lphas1,pColor,0,11,1,0,10,0,0);

	  tfphas1 = new TextField(4); tfphas1.setText("0");
      addComponent(tfphas1,Color.white,1,11,1,0,0,0,20);

    lbvk = new Label("Bildverkleinerung"); lbvk.setForeground(Color.black);
    addComponent(lbvk,pColor,0,12,1,0,10,0,0);

      tfbvk = new TextField(4); tfbvk.setText("1");
      addComponent(tfbvk,Color.white,1,12,1,0,0,0,20);


    s = getParameter("anzeigenKurveA");
    if (s == null) cbA = new Checkbox("KurveA ", true);
	if ("false".equals(s))
	{ cbA = new Checkbox("KurveA ", false);}
	else
	{ cbA = new Checkbox("KurveA ", true); }

	s = getParameter("anzeigenKurveB");
	if (s == null) cbB = new Checkbox("KurveB ", true);
	if ("false".equals(s))
	{ cbB = new Checkbox("KurveB ",false); }
	else
	{ cbB = new Checkbox("KurveB ", true); }

	s = getParameter("anzeigenText");
	if (s == null) cbC = new Checkbox("Text", true);
	if ("false".equals(s))
	{ cbC = new Checkbox("Text",false); }
	else
	{ cbC = new Checkbox("Text", true); }

    s = getParameter("anzeigenKreise");
    if (s == null) cbR = new Checkbox("Kreise um 0", true);
	if ("false".equals(s))
	{ cbR = new Checkbox("Kreise um 0", false);}
	else
	{ cbR = new Checkbox("Kreise um 0", true); }

	addComponent(cbA,pColor,0,13,1,0,20,0,0);       // Hinzufügen zur Schaltfläche
	addComponent(cbB,pColor,1,13,1,0,0,0,0);
	addComponent(cbR,pColor,0,14,1,0,20,0,0);
	addComponent(cbC,pColor,1,14,1,0,0,0,0);


    bPause = new Button(text[3]);
    addComponent(bPause,Color.white,0,16,4,10,10,0,10);
    addComponent(new Label(text[4]),pColor,0,17,4,0,10,0,0);
    addComponent(new Label(text[5]),pColor,0,18,4,0,10,0,0);
    addComponent(new Label(text[6]),pColor,0,19,4,0,10,0,0);
    addComponent(new Label(text[7]),pColor,0,20,4,0,10,0,0);
    add("East",p);

    tfvN.addActionListener(this);
    tfneun.addActionListener(this);
    tfneunB.addActionListener(this);
    tfEins.addActionListener(this);
    tfphas1.addActionListener(this);
    tfphas2.addActionListener(this);
    tfianz.addActionListener(this);
    tfstarth.addActionListener(this);
    tfhfakt.addActionListener(this);
    tfTheta.addActionListener(this);
    tfbvk.addActionListener(this);
    tfkreist.addActionListener(this);
    bPause.addActionListener(this);


    s = getParameter("Windungen");
    if (s != null) { tfvN.setText(s); vN = stringToDouble(s); }

    s = getParameter("Faktor_a");
    if (s != null) { tfneun.setText(s); neun = stringToDouble(s); }

    s = getParameter("Faktor_b");
    if (s != null) { tfneunB.setText(s); neunB = stringToDouble(s); }

    s = getParameter("Eins_in_k");
    if (s != null) { tfEins.setText(s); Eins = stringToDouble(s); }

    s = getParameter("Verdrehwinkel");
    if (s != null) { tfphas2.setText(s); phas2 = stringToDouble(s); }

    s = getParameter("Spiralenzahl");
    if (s != null) { tfianz.setText(s); ianz = Integer.parseInt(s); }

    s = getParameter("Starthoehe");
    if (s != null) { tfstarth.setText(s); starth = stringToDouble(s); }

    s = getParameter("Hoehenfaktor");
    if (s != null) { tfhfakt.setText(s); hfakt = stringToDouble(s); }

 	s = getParameter("Schrittzahl");
    if (s != null) { tfkreist.setText(s); kreisteile = Integer.parseInt(s); }

 	s = getParameter("AnzahlKreise");
    if (s != null) { AnzahlKreise = Integer.parseInt(s); }

	s = getParameter("Kippwinkel");
	if (s != null) { tfTheta.setText(s); wink = stringToDouble(s); }

    s = getParameter("Winkel_X-Achse");
    if (s != null) { tfphas1.setText(s); phas1 = stringToDouble(s); }

    s = getParameter("Bildverkleinerung");
	if (s != null) { tfbvk.setText(s); bvk = stringToDouble(s); }

	s = getParameter("ColorBackground");
	if (s != null) bgColor = new Color(Integer.parseInt(s,16));

	s = getParameter("ColorPanel");
	if (s != null) pColor = new Color(Integer.parseInt(s,16));

	s = getParameter("ColorSchrift");
	if (s != null) sColor = new Color(Integer.parseInt(s,16));

	s = getParameter("ColorX_Achse");
	if (s != null) xColor = new Color(Integer.parseInt(s,16));

	s = getParameter("ColorY_Achse");
	if (s != null) yColor = new Color(Integer.parseInt(s,16));

	s = getParameter("ColorZ_Achse");
	if (s != null) zColor = new Color(Integer.parseInt(s,16));

    theta = PI/180*wink;
    phas1 = PI/180*(-phas1+90);
    phas2 = PI/180*phas2;

    on = false;
    thr = new Thread(this);
    thr.start();
  }

//----------------------------------------------------------

 // Stoppen der Animation:

  public void stop ()
  {
    removeAll();
    thr = null;
  }

//----------------------------------------------------------

  public void destroy()
  {
    bPause.removeActionListener(this);
    tfvN.removeActionListener(this);
    tfneun.removeActionListener(this);
    tfneunB.removeActionListener(this);
    tfEins.removeActionListener(this);
    tfphas1.removeActionListener(this);
    tfphas2.removeActionListener(this);
    tfianz.removeActionListener(this);
    tfstarth.removeActionListener(this);
    tfhfakt.removeActionListener(this);
    tfTheta.removeActionListener(this);
    tfkreist.removeActionListener(this);
    tfbvk.removeActionListener(this);
    g1 = null;
    g2 = null;
    offscreen = null;
    System.gc();
  }


//----------------------------------------------------------

 // Laufen des Programms (Endlosschleife)

  public void run ()
  {
    long t0, t1;
    t0 = System.currentTimeMillis();

    Thread thisThread = Thread.currentThread();

	while (thr == thisThread)
    {
      paint(g2);
      g1.drawImage(offscreen,0,0,this);

      try {Thread.sleep(50);}
      catch (InterruptedException ie) {}

      t1 = System.currentTimeMillis();
      if (on) t += (t1-t0)/1000.0;
      t0 = t1;
    }

  }

//----------------------------------------------------------

  // Bildschirmkoordinaten (orthogonale Parallelprojektion):

  int screenU (double x, double y)
  {
    x=x/bvk; y=y/bvk;
    return (int)Math.round(u0+20*(a1*x+a2*y));
  }

//----------------------------------------------------------

  int screenV (double x, double y, double z)
  {
	x=x/bvk; y=y/bvk; z=z/bvk;
    return (int)Math.round(v0+20*(b1*x+b2*y+b3*z));
  }

//----------------------------------------------------------

// Koeffizienten für Parallelprojektion:

  void calcCoeff ()
  {
    double sin = Math.sin(theta), cos = Math.cos(theta);
    a1 = Math.sin(phi); a2 = -Math.cos(phi);     // Nach "rechts"
    b1 = sin*a2; b2 = -sin*a1; b3 = -cos;        // Nach "oben"
    c1 = -cos*a2; c2 = cos*a1; c3 = -sin;        // Projektionsrichtung
  }

//----------------------------------------------------------

// Umwandlung eines Strings in eine Fließkommazahl:

  double stringToDouble (String s)
  {
    StringBuffer sbuf = new StringBuffer(s);
    double val;

    for (int i=0; i < sbuf.length(); i++) if (sbuf.charAt(i) == ',')

    sbuf.setCharAt(i,'.');
    try {val = Double.valueOf(sbuf.toString()).doubleValue();}
    catch (NumberFormatException e) {val = 0;}
    return val;
  }

//----------------------------------------------------------

  // Pfeil mit einfacher Dicke:
  // (u0,v0), (u1,v1) ... Endpunkte (Bildschirmkoordinaten)

  void drawArrow (int u0, int v0, int u1, int v1)
  {
    double w, dw = 0.2, r = 10, du = u1-u0, dv = v0-v1;
    if (du == 0 && dv == 0) return;
    g2.drawLine(u0,v0,u1,v1);
    w = Math.atan2(dv,du);
    u0 = (int)Math.round(u1-r*Math.cos(w+dw));
    v0 = (int)Math.round(v1+r*Math.sin(w+dw));
    g2.drawLine(u0,v0,u1,v1);
    u0 = (int)Math.round(u1-r*Math.cos(w-dw));
    v0 = (int)Math.round(v1+r*Math.sin(w-dw));
    g2.drawLine(u0,v0,u1,v1);
  }

//----------------------------------------------------------

  // Linie mit dreifacher Dicke:
  // (u0,v0), (u1,v1) ... Endpunkte (Bildschirmkoordinaten)

  void thickLine (int u0, int v0, int u1, int v1)
  {
    g2.drawLine(u0,v0,u1,v1);

    if (Math.abs(u1-u0) > Math.abs(v1-v0))
    {
      g2.drawLine(u0,v0-1,u1,v1-1);
      g2.drawLine(u0,v0+1,u1,v1+1);
    }
    else
    {
	  g2.drawLine(u0-1,v0,u1-1,v1);
	  g2.drawLine(u0+1,v0,u1+1,v1);
	}
  }

//----------------------------------------------------------

  // Pfeil mit dreifacher Dicke:
  // (u0,v0), (u1,v1) ... Endpunkte (Bildschirmkoordinaten)

  void thickArrow (int u0, int v0, int u1, int v1)
  {
    double w, dw = 0.2, r = 8, du = u1-u0, dv = v0-v1;

    if (du == 0 && dv == 0) return;

    thickLine(u0,v0,u1,v1);
    w = Math.atan2(dv,du);
    u0 = (int)Math.round(u1-r*Math.cos(w+dw));
    v0 = (int)Math.round(v1+r*Math.sin(w+dw));
    thickLine(u0,v0,u1,v1);
    u0 = (int)Math.round(u1-r*Math.cos(w-dw));
    v0 = (int)Math.round(v1+r*Math.sin(w-dw));
    thickLine(u0,v0,u1,v1);
  }

//----------------------------------------------------------

  // Achse mit Unterteilung:
  // (x1,y1,z1) ... Spitze

  void drawAxis (int u0, int v0, int u1, int v1)
  {
    int i, u, v, duu, dvv;
    double dU, dV, du, dv, length;
    dU = (u1-u0)/12.0; dV = (v1-v0)/12.0;
    du = -dV; dv = dU; length = Math.sqrt(du*du+dv*dv);
    duu = (int)Math.round(3*du/length);
    dvv = (int)Math.round(3*dv/length);
    drawArrow(u0,v0,u1,v1);

    for (i=1; i <= 11; i++)
    {
      u = (int)Math.round(u0+i*dU);
      v = (int)Math.round(v0+i*dV);
      //g2.drawLine(u-duu,v-dvv,u+duu,v+dvv);
    }
  }

//----------------------------------------------------------

  // Koordinatensystem:

 void drawCoordSystem ()
  {
    int u0, v0, u1, v1, a = 10;
    u0 = screenU(-a,0); v0 = screenV(-a,0,0);
    u1 = screenU(a,0); v1 = screenV(a,0,0);
    g2.setColor(xColor); drawAxis(u0,v0,u1,v1);
    g2.drawString("x",u1-4,v1+12);
    u0 = screenU(0,-a); v0 = screenV(0,-a,0);
    u1 = screenU(0,a); v1 = screenV(0,a,0);
    g2.setColor(yColor); drawAxis(u0,v0,u1,v1);
    g2.drawString("y",u1-4,v1+12);
    u0 = screenU(0,0); v0 = screenV(0,0,-a);
    u1 = u0; v1 = screenV(0,0,a);
    g2.setColor(zColor); drawAxis(u0,v0,u1,v1);
    g2.drawString("z",u1-12,v1+4);
  }

//----------------------------------------------------------


 // Torus:

  void drawTorus ()
  {
    int i,j,u001,v001,u01=0,v01=0,is, Nkreisteile=(int)(kreisteile*vN),izeile,sig,ii;
    double winkelphi,winkelphiD2Pi,winkelphiT, uuu=0,vvv=0,www=starth,u000,v000,w000,paramv=0,Lq,L=0,Lges;
    double swphi, swtheta=0, swz;
    String Stext;
    double z6=1000000,dR=0,hoehe=starth;
    double Rgrenz=1,LdR,costheta,sintheta,Rneu=paramv,Ralt,Rverh,P120,ph1,ph2,delta,neunA,neunC=neunB,arg,Rmax=Rneu;


 swphi = zPI/kreisteile;
 swz = swphi*hfakt;

 P120 = PI*(360/ianz)/180;
 ph1=-P120;
 ph2=phas2-P120;

 for (ii = 0; ii < ianz; ii++ )
 {
   ph2 += P120;
   ph1 += P120;

	winkelphi = zPI*vN;
	winkelphiT = 0;

    neunA=neun;
    g2.setColor(Color.black);
	neunC = Eins + neunB;
    arg = winkelphi/neunC;

    if(Math.abs(arg) < 50)
    { paramv = neunA*(1.0 + Math.pow(fiGold,arg)); }

    Rneu = paramv;
    uuu = paramv*Math.cos(winkelphi+ph1);
	vvv = paramv*Math.sin(winkelphi+ph1);
	www=starth;
	hoehe = starth;

	Ralt=Rneu; Rverh=1.0;
	izeile=0;
	Rmax=Rneu;

	Stext = "R_max= " + Double.toString(Rmax) + " ";
	izeile +=15;
	if (cbC.getState()) g2.drawString(Stext,5,izeile);


  is = Nkreisteile; sig=1;
  while (is > -Nkreisteile)
  {
         is--;

		 winkelphi -=swphi;

         if (is == -1)
         {
		   neunC = Eins-neunB;
		   g2.setColor(Color.blue);
 	     }

  	     arg=winkelphi/neunC;

  	     if(Math.abs(arg) < 50)
  	     { paramv = neunA*(1.0 + Math.pow(fiGold,arg)); }
		 else
  	     { continue; }

  	     hoehe -= swz/paramv;


         u000=uuu; v000=vvv; w000=www;

         if (is >= 0 )
         { uuu = paramv*Math.cos(winkelphi+ph1);
		   vvv = paramv*Math.sin(winkelphi+ph1);
	     }
		 else
	     { uuu = paramv*Math.cos(winkelphi+ph2);
		   vvv = paramv*Math.sin(winkelphi+ph2);
	     }
		 www = hoehe;

	     winkelphiT +=swphi;
         if (winkelphiT > zPI)
         {
		   winkelphiT -= zPI;
		   Ralt=Rneu; Rneu=paramv; Rverh=Rneu/Ralt;
		   Stext = "R_neu/R_alt= " + Double.toString(Rverh) + " ";
		   izeile +=15;
		   if (cbC.getState()) g2.drawString(Stext,5,izeile);
         }

	     u001 = screenU(u000,v000); v001 = screenV(u000,v000,w000);
		 u01 = screenU(uuu,vvv); v01 = screenV(uuu,vvv,www);

	     if (cbA.getState() && is > -1) g2.drawLine(u001,v001,u01,v01);
	     if (cbB.getState() && is < -1 ) g2.drawLine(u001,v001,u01,v01);


   } // Ende while1


  } //Ende for

  // Kreise

if(cbR.getState())
{
  g2.setColor(Color.red);
  paramv=1.75;

  for (ii = 0; ii < 11; ii++ )
  {
    winkelphi = 0;
    is = 0;
    www = starth; uuu=paramv; vvv=0;

    while (is < Nkreisteile)
    {
         is++;

  		 winkelphi -=swphi;

         u000=uuu; v000=vvv; w000=www;
         uuu = paramv*Math.cos(winkelphi);
  		 vvv = paramv*Math.sin(winkelphi);

  	     u001 = screenU(u000,v000); v001 = screenV(u000,v000,w000);
  		 u01 = screenU(uuu,vvv); v01 = screenV(uuu,vvv,www);

  	     g2.drawLine(u001,v001,u01,v01);

     } // Ende while1

     Ralt = paramv;
     paramv = paramv*2-1;
     if(ii == 8) paramv=73;
     if(ii == 9) paramv=1;

     Stext = "R= " + Double.toString(Ralt) + " ";
     g2.drawString(Stext,u01,v01);

   } // Ende for Kreise
  } //Ende Kreise

 }


//----------------------------------------------------------

 // Grafik:

  public void paint (Graphics g)
  {
    g.setFont(fSS);
    //phi = omega*t;
    phi = phas1;

    calcCoeff();
    g.setColor(bgColor);
    g.fillRect(0,0,width,height);
    if(cbR.getState()) drawCoordSystem();
    drawTorus();

  }

 //----------------------------------------------------------

 // Eingabe aus Textfeld:
  // tf .... Textfeld
  // min ... Minimum
  // max ... Maximum

  double inputTF (TextField tf, double min, double max)
  {
    double value = stringToDouble(tf.getText());

   /*
    if (value < min) value = min;
    if (value > max) value = max;
    */

    tf.setText("" + value);
    return value;
  }

//----------------------------------------------------------

  void newValue ()
  {
    String kt="360";

    vN = inputTF(tfvN,-max,+max);
    neun = inputTF(tfneun,-max,+max);
    neunB = inputTF(tfneunB,-max,+max);
    Eins = inputTF(tfEins,-max,+max);

    phas1 = PI/180*(90 - inputTF(tfphas1,-max,+max));
    phas2 = PI/180*inputTF(tfphas2,-max,+max);

    ianz = (int)(inputTF(tfianz,-max,+max));
    tfianz.setText("" + ianz);

    starth = inputTF(tfstarth,-max,+max);
    hfakt = inputTF(tfhfakt,-max,+max);
    kreisteile = (int)(inputTF(tfkreist,-max,+max));
    tfkreist.setText("" + kreisteile);
    theta = PI/180*inputTF(tfTheta,-360,360);

    if (bvk > 0) { bvk = inputTF(tfbvk,-max,+max); }
    else
    { bvk=1.0; tfbvk.setText("1.0"); }

    calcCoeff();
  }

//----------------------------------------------------------

  public void actionPerformed (ActionEvent e)
  {
      newValue();
      // on = !on;

  }

//----------------------------------------------------------

}

//----------------------------------------------------------
//----------------------------------------------------------
