package ch11;

import java.applet.*;
import java.awt.*;
import java.awt.event.*;
/**
 * Insert the type's description here.
 * Creation date: (9/18/2001 4:10:42 PM)
 * @author: Administrator
 */
public class CalcRatiosApplet extends Applet implements KeyListener, MouseListener {
	private TextField ivjBallastTextField = null;
	private TextField ivjBeamTextField = null;
	private TextField ivjDisplacementTextField = null;
	private TextField ivjHullSpeedTextField = null;
	private Label ivjLabel1 = null;
	private Label ivjLabel10 = null;
	private Label ivjLabel11 = null;
	private Label ivjLabel12 = null;
	private Label ivjLabel13 = null;
	private Label ivjLabel2 = null;
	private Label ivjLabel3 = null;
	private Label ivjLabel4 = null;
	private Label ivjLabel5 = null;
	private Label ivjLabel6 = null;
	private Label ivjLabel7 = null;
	private Label ivjLabel8 = null;
	private Label ivjLabel9 = null;
	private TextField ivjLengthOverAllTextField = null;
	private TextField ivjLengthWaterLineTextField = null;
	private TextField ivjSailAreaTextField = null;
	private TextField ivjBallastDispTextField = null;
	private TextField ivjCapsizeRiskTextField = null;
	private TextField ivjLOABeamTestField = null;
	private TextField ivjSailAreaDispRatioTextField = null;
	private TextField ivjVelocityRatioTextField = null;
	private Button ivjCalcRatiosButton = null;
	private Button ivjResetButton = null;
	private Label ivjLabel14 = null;
	IvjEventHandler ivjEventHandler = new IvjEventHandler();
	private TextField ivjDispLengthRatioTextField = null;
	private CalcRatios ivjCalcRatios1 = null;
	private TextField ivjBlankTextField = null;
	private boolean ivjConnPtoP1Aligning = false;
	private boolean ivjConnPtoP2Aligning = false;
	private boolean ivjConnPtoP3Aligning = false;
	private boolean ivjConnPtoP4Aligning = false;
	private boolean ivjConnPtoP5Aligning = false;
	private boolean ivjConnPtoP6Aligning = false;
	private java.lang.String fieldMsgCR2 = new String();
	private TextField ivjTextField1 = null;
	private TextField ivjTextField2 = null;
	private TextField ivjTextField3 = null;
	private TextField ivjTextField4 = null;
	private TextField ivjComfortFactorTextField = null;
	private Label ivjComfort = null;

class IvjEventHandler implements java.awt.event.ActionListener, java.awt.event.KeyListener, java.awt.event.MouseListener, java.awt.event.TextListener, java.beans.PropertyChangeListener {
		public void actionPerformed(java.awt.event.ActionEvent e) {
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM55(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM56(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM57(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM58(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM59(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM60(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM73(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM5(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM47(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM48(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM49(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM53(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM41(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM42(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM43(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM44(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM45(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM46(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM54(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM143(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM144(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM145(e);
			if (e.getSource() == CalcRatiosApplet.this.getCalcRatiosButton()) 
				connEtoM146(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM147(e);
			if (e.getSource() == CalcRatiosApplet.this.getResetButton()) 
				connEtoM2(e);
		};
		public void keyPressed(java.awt.event.KeyEvent e) {
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoC1(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoC2(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoC3(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoC4(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoC5(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoC6(e);
		};
		public void keyReleased(java.awt.event.KeyEvent e) {};
		public void keyTyped(java.awt.event.KeyEvent e) {};
		public void mouseClicked(java.awt.event.MouseEvent e) {};
		public void mouseEntered(java.awt.event.MouseEvent e) {
			if (e.getSource() == CalcRatiosApplet.this.getHullSpeedTextField()) 
				connEtoM8(e);
			if (e.getSource() == CalcRatiosApplet.this.getVelocityRatioTextField()) 
				connEtoM6(e);
			if (e.getSource() == CalcRatiosApplet.this.getCapsizeRiskTextField()) 
				connEtoM11(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastDispTextField()) 
				connEtoM10(e);
			if (e.getSource() == CalcRatiosApplet.this.getDispLengthRatioTextField()) 
				connEtoM7(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaDispRatioTextField()) 
				connEtoM9(e);
			if (e.getSource() == CalcRatiosApplet.this.getLOABeamTestField()) 
				connEtoM12(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel13()) 
				connEtoM61(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel13()) 
				connEtoM62(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel13()) 
				connEtoM63(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel12()) 
				connEtoM64(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel12()) 
				connEtoM65(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel12()) 
				connEtoM66(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel11()) 
				connEtoM67(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel11()) 
				connEtoM68(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel11()) 
				connEtoM69(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel9()) 
				connEtoM70(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel9()) 
				connEtoM71(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel9()) 
				connEtoM72(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel8()) 
				connEtoM74(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel8()) 
				connEtoM75(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel8()) 
				connEtoM76(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel10()) 
				connEtoM77(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel10()) 
				connEtoM78(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel10()) 
				connEtoM79(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel7()) 
				connEtoM81(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel7()) 
				connEtoM82(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel7()) 
				connEtoM83(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel1()) 
				connEtoM84(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel1()) 
				connEtoM85(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel1()) 
				connEtoM86(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel2()) 
				connEtoM87(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel2()) 
				connEtoM88(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel2()) 
				connEtoM89(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel3()) 
				connEtoM90(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel3()) 
				connEtoM91(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel3()) 
				connEtoM92(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel4()) 
				connEtoM93(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel4()) 
				connEtoM94(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel4()) 
				connEtoM95(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel5()) 
				connEtoM96(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel5()) 
				connEtoM97(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel5()) 
				connEtoM98(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel6()) 
				connEtoM99(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel6()) 
				connEtoM100(e);
			if (e.getSource() == CalcRatiosApplet.this.getLabel6()) 
				connEtoM101(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM113(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM115(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM116(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM117(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM118(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM114(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfort()) 
				connEtoM148(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfort()) 
				connEtoM149(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfort()) 
				connEtoM150(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM155(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM156(e);
		};
		public void mouseExited(java.awt.event.MouseEvent e) {
			if (e.getSource() == CalcRatiosApplet.this.getHullSpeedTextField()) 
				connEtoM13(e);
			if (e.getSource() == CalcRatiosApplet.this.getHullSpeedTextField()) 
				connEtoM14(e);
			if (e.getSource() == CalcRatiosApplet.this.getHullSpeedTextField()) 
				connEtoM15(e);
			if (e.getSource() == CalcRatiosApplet.this.getHullSpeedTextField()) 
				connEtoM16(e);
			if (e.getSource() == CalcRatiosApplet.this.getVelocityRatioTextField()) 
				connEtoM17(e);
			if (e.getSource() == CalcRatiosApplet.this.getVelocityRatioTextField()) 
				connEtoM18(e);
			if (e.getSource() == CalcRatiosApplet.this.getVelocityRatioTextField()) 
				connEtoM19(e);
			if (e.getSource() == CalcRatiosApplet.this.getVelocityRatioTextField()) 
				connEtoM20(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaDispRatioTextField()) 
				connEtoM21(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaDispRatioTextField()) 
				connEtoM22(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaDispRatioTextField()) 
				connEtoM23(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaDispRatioTextField()) 
				connEtoM24(e);
			if (e.getSource() == CalcRatiosApplet.this.getDispLengthRatioTextField()) 
				connEtoM25(e);
			if (e.getSource() == CalcRatiosApplet.this.getDispLengthRatioTextField()) 
				connEtoM26(e);
			if (e.getSource() == CalcRatiosApplet.this.getDispLengthRatioTextField()) 
				connEtoM27(e);
			if (e.getSource() == CalcRatiosApplet.this.getDispLengthRatioTextField()) 
				connEtoM28(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastDispTextField()) 
				connEtoM29(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastDispTextField()) 
				connEtoM30(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastDispTextField()) 
				connEtoM31(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastDispTextField()) 
				connEtoM32(e);
			if (e.getSource() == CalcRatiosApplet.this.getLOABeamTestField()) 
				connEtoM33(e);
			if (e.getSource() == CalcRatiosApplet.this.getLOABeamTestField()) 
				connEtoM34(e);
			if (e.getSource() == CalcRatiosApplet.this.getLOABeamTestField()) 
				connEtoM35(e);
			if (e.getSource() == CalcRatiosApplet.this.getLOABeamTestField()) 
				connEtoM36(e);
			if (e.getSource() == CalcRatiosApplet.this.getCapsizeRiskTextField()) 
				connEtoM37(e);
			if (e.getSource() == CalcRatiosApplet.this.getCapsizeRiskTextField()) 
				connEtoM38(e);
			if (e.getSource() == CalcRatiosApplet.this.getCapsizeRiskTextField()) 
				connEtoM39(e);
			if (e.getSource() == CalcRatiosApplet.this.getCapsizeRiskTextField()) 
				connEtoM40(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM119(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM120(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM121(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM122(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM123(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM124(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM126(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM127(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM129(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM130(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM131(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM132(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM133(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM134(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM128(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM125(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM135(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM136(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM137(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM138(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM139(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM140(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM141(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM142(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM157(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM158(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM159(e);
			if (e.getSource() == CalcRatiosApplet.this.getComfortFactorTextField()) 
				connEtoM160(e);
		};
		public void mousePressed(java.awt.event.MouseEvent e) {};
		public void mouseReleased(java.awt.event.MouseEvent e) {};
		public void propertyChange(java.beans.PropertyChangeEvent evt) {
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("hullSpeed"))) 
				connPtoP7SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("velocityRatio"))) 
				connPtoP8SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("sailAreaDispRatio"))) 
				connPtoP9SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("dispLengthRatio"))) 
				connPtoP10SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("ballastDisp"))) 
				connPtoP11SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("loaBeamRatio"))) 
				connPtoP12SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("capsizeRisk"))) 
				connPtoP13SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("lengthWaterLine"))) 
				connPtoP1SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("sailArea"))) 
				connPtoP2SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("displacement"))) 
				connPtoP3SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("ballast"))) 
				connPtoP4SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("beam"))) 
				connPtoP5SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("lengthOverAll"))) 
				connPtoP6SetSource();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("hullSpeed"))) 
				connPtoP14SetTarget();
			if (evt.getSource() == CalcRatiosApplet.this.getCalcRatios1() && (evt.getPropertyName().equals("comfortFactor"))) 
				connPtoP15SetTarget();
		};
		public void textValueChanged(java.awt.event.TextEvent e) {
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connPtoP1SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connPtoP2SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connPtoP3SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connPtoP4SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connPtoP5SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connPtoP6SetTarget();
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM80(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM103(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM104(e);
			if (e.getSource() == CalcRatiosApplet.this.getSailAreaTextField()) 
				connEtoM105(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM106(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM107(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM108(e);
			if (e.getSource() == CalcRatiosApplet.this.getBallastTextField()) 
				connEtoM109(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM110(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM111(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM112(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthWaterLineTextField()) 
				connEtoM151(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM152(e);
			if (e.getSource() == CalcRatiosApplet.this.getBeamTextField()) 
				connEtoM153(e);
			if (e.getSource() == CalcRatiosApplet.this.getLengthOverAllTextField()) 
				connEtoM154(e);
			if (e.getSource() == CalcRatiosApplet.this.getDisplacementTextField()) 
				connEtoM102(e);
		};
	};
/**
 * Comment
 */
public void ballastTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
/**
 * Comment
 */
public void beamTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
/**
 * Comment
 */
public void capsizeRiskTextField_Foreground(java.awt.Color arg1) {
	return;
}
/**
 * Comment
 */
public void colorEditor1_Foreground(java.awt.Color arg1) {
	return;
}
/**
 * connEtoC1:  (LengthWaterLineTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.lengthWaterLineTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC1(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.lengthWaterLineTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoC2:  (SailAreaTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.sailAreaTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC2(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.sailAreaTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoC3:  (DisplacementTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.displacementTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC3(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.displacementTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoC4:  (BallastTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.ballastTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC4(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.ballastTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoC5:  (BeamTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.beamTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC5(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.beamTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoC6:  (LengthOverAllTextField.key.keyPressed(java.awt.event.KeyEvent) --> CalcRatiosApplet.lengthOverAllTextField_KeyPressed(Ljava.awt.event.KeyEvent;)V)
 * @param arg1 java.awt.event.KeyEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoC6(java.awt.event.KeyEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		this.lengthOverAllTextField_KeyPressed(arg1);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * Comment
 */
public void connEtoC7_NormalResult() {
	return;
}
/**
 * Comment
 */
public void connEtoC7_NormalResult1() {
	return;
}
/**
 * connEtoM1:  (CalcRatiosApplet.init() --> LengthWaterLineTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM1() {
	try {
		// user code begin {1}
		// user code end
		getLengthWaterLineTextField().setText("23");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM10:  (BallastDispTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM10(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgBallastDisp());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM100:  (Label6.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM100(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("has excessive weather or lee helm, bow sprints are ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM101:  (Label6.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM101(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("often added to accomodate new sail plans. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM102:  (DisplacementTextField.text.textValueChanged(java.awt.event.TextEvent) --> VelocityRatioTextField.text)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM102(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getVelocityRatioTextField().setText("0.0");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM103:  (LengthWaterLineTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.dispLengthRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM103(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setDispLengthRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM104:  (SailAreaTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.velocityRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM104(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setVelocityRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM105:  (SailAreaTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.sailAreaDispRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM105(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setSailAreaDispRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM106:  (DisplacementTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.dispLengthRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM106(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setDispLengthRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM107:  (DisplacementTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.ballastDisp)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM107(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setBallastDisp(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM108:  (DisplacementTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.capsizeRisk)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM108(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setCapsizeRisk(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM109:  (BallastTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.ballastDisp)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM109(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setBallastDisp(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM11:  (CapsizeRiskTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM11(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgCapsizeRisk());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM110:  (BeamTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.loaBeamRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM110(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setLoaBeamRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM111:  (BeamTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.capsizeRisk)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM111(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setCapsizeRisk(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM112:  (LengthOverAllTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.loaBeamRatio)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM112(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setLoaBeamRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM113:  (LengthWaterLineTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM113(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter value for LWL (length at water line).");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM114:  (SailAreaTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM114(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter SA (sail area) value.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM115:  (DisplacementTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM115(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter Displacement value. Include ballast.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM116:  (BallastTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM116(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter ballast value.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM117:  (BeamTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM117(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter Beam value.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM118:  (LengthOverAllTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM118(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText("Enter LOA value.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM119:  (LengthWaterLineTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM119(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM12:  (LOABeamTestField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM12(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgLoaBeam());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM120:  (LengthWaterLineTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM120(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM121:  (LengthWaterLineTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM121(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM122:  (LengthWaterLineTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM122(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM123:  (SailAreaTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM123(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM124:  (SailAreaTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM124(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM125:  (SailAreaTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM125(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM126:  (SailAreaTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM126(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM127:  (DisplacementTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM127(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM128:  (DisplacementTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM128(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM129:  (DisplacementTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM129(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM13:  (HullSpeedTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM13(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM130:  (DisplacementTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM130(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM131:  (BallastTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM131(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM132:  (BallastTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM132(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM133:  (BallastTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM133(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM134:  (BallastTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM134(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM135:  (BeamTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM135(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM136:  (BeamTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM136(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM137:  (BeamTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM137(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM138:  (BeamTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM138(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM139:  (LengthOverAllTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM139(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM14:  (HullSpeedTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM14(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM140:  (LengthOverAllTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM140(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM141:  (LengthOverAllTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM141(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM142:  (LengthOverAllTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM142(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM143:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.line2Comment)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM143(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM144:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> TextField3.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM144(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM145:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> TextField4.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM145(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM146:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.comfortFactor()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM146(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().comfortFactor();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM147:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.comfortFactor)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM147(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setComfortFactor(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM148:  (Comfort.mouse.mouseEntered(java.awt.event.MouseEvent) --> TextField2.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM148(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Measure of motion comfort that while tongue-in-cheek");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM149:  (Comfort.mouse.mouseEntered(java.awt.event.MouseEvent) --> TextField3.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM149(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("identifies jerkey motion at < 20 and sluggish vessels");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM15:  (HullSpeedTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM15(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM150:  (Comfort.mouse.mouseEntered(java.awt.event.MouseEvent) --> TextField4.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM150(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("at > 50. Added weight increases value.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM151:  (LengthWaterLineTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.comfortFactor)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM151(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setComfortFactor(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM152:  (DisplacementTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.comfortFactor)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM152(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setComfortFactor(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM153:  (BeamTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.comfortFactor)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM153(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setComfortFactor(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM154:  (LengthOverAllTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.comfortFactor)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM154(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setComfortFactor(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM155:  (ComfortFactorTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> CalcRatios1.msgDispLenthRatio()V)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM155(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().msgDispLenthRatio();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM156:  (ComfortFactorTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> TextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM156(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgComfortFactor());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM157:  (ComfortFactorTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> TextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM157(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM158:  (ComfortFactorTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> TextField2.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM158(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM159:  (ComfortFactorTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> TextField3.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM159(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM16:  (HullSpeedTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM16(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM160:  (ComfortFactorTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> TextField4.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM160(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM17:  (VelocityRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM17(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM18:  (VelocityRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM18(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM19:  (VelocityRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM19(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM2:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> SailAreaTextField.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM2(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setLengthWaterLine(23.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM20:  (VelocityRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM20(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM21:  (SailAreaDispRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM21(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM22:  (SailAreaDispRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM22(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM23:  (SailAreaDispRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM23(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM24:  (SailAreaDispRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM24(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM25:  (DispLengthRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM25(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM26:  (DispLengthRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM26(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM27:  (DispLengthRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM27(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM28:  (DispLengthRatioTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM28(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM29:  (BallastDispTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM29(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM3:  (CalcRatiosApplet.init() --> DisplacementTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM3() {
	try {
		// user code begin {1}
		// user code end
		getDisplacementTextField().setText("3750");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM30:  (BallastDispTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM30(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM31:  (BallastDispTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM31(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM32:  (BallastDispTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM32(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM33:  (LOABeamTestField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM33(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM34:  (LOABeamTestField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM34(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM35:  (LOABeamTestField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM35(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM36:  (LOABeamTestField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM36(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM37:  (CapsizeRiskTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM37(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM38:  (CapsizeRiskTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM38(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM39:  (CapsizeRiskTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM39(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM4:  (CalcRatiosApplet.init() --> LengthOverAllTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM4() {
	try {
		// user code begin {1}
		// user code end
		getLengthOverAllTextField().setText("25.8333");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM40:  (CapsizeRiskTextField.mouse.mouseExited(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM40(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText(getBlankTextField().getText());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM41:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> VelocityRatioTextField.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM41(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setHullSpeed(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM42:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> SailAreaDispRatioTextField.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM42(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setVelocityRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM43:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.sailAreaDispRatio)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM43(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setSailAreaDispRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM44:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.dispLengthRatio)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM44(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setDispLengthRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM45:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.ballastDisp)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM45(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setBallastDisp(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM46:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.loaBeamRatio)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM46(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setLoaBeamRatio(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM47:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.displacement)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM47(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setDisplacement(3750.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM48:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.ballast)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM48(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setBallast(1400.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM49:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.beam)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM49(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setBeam(7.8333);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM5:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> HullSpeedTextField.text)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM5(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		getCapsizeRiskTextField().setText("0.0");

		// user code end
		getCalcRatios1().setSailArea(281.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM50:  (CalcRatiosApplet.init() --> SailAreaTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM50() {
	try {
		// user code begin {1}
		// user code end
		getSailAreaTextField().setText("281");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM51:  (CalcRatiosApplet.init() --> BallastTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM51() {
	try {
		// user code begin {1}
		// user code end
		getBallastTextField().setText("1400");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM52:  (CalcRatiosApplet.init() --> BeamTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM52() {
	try {
		// user code begin {1}
		// user code end
		getBeamTextField().setText("7.8333");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM53:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.lengthOverAll)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM53(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setLengthOverAll(25.8333);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM54:  (ResetButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.capsizeRisk)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM54(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setCapsizeRisk(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM55:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.capsizeRisk()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM55(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().capsizeRisk();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM56:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.hullSpeed()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM56(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().hullSpeed();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM57:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.velocityRatio()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM57(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().velocityRatio();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM58:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.sailAreaDispRatio()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM58(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().sailAreaDispRatio();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM59:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.ballastDisp()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM59(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().ballastDisp();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM6:  (BallastDispTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM6(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgVelocityRatio());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM60:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.loaBeamRatio()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM60(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().loaBeamRatio();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM61:  (Label13.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM61(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("This formula penalizes boats with a large beam for their ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM62:  (Label13.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM62(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("high inverted stability, and light boats for their response to");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM63:  (Label13.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM63(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("large waves.  Values under 2 are ocean passagemakers.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM64:  (Label12.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM64(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("About 3.0 and higher promotes easy motion, high");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM65:  (Label12.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM65(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("speed (low drag), and good balance when heeled. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM66:  (Label12.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM66(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Fineness of the hull is measured by this ratio.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM67:  (Label11.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM67(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("With other ratios can give an indicator of stability.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM68:  (Label11.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM68(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("Values range from a low of .25 to a high of around .50.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM69:  (Label11.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM69(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Centers and heel angle and weight need consideration.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM7:  (DispLengthRatioTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM7(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgDispLengthRatio());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM70:  (Label9.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM70(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Many racing designs are below 100. Racing cruisers");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM71:  (Label9.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM71(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("are around 100. True planing performance below 150.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM72:  (Label9.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM72(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Cruising racers have values to the high 300\'s. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM73:  (CalcRatiosButton.action.actionPerformed(java.awt.event.ActionEvent) --> CalcRatios1.dispLengthRatio()V)
 * @param arg1 java.awt.event.ActionEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM73(java.awt.event.ActionEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().dispLengthRatio();
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM74:  (Label8.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM74(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Traditional monohull requires range between 16 and 18");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM75:  (Label8.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM75(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("for racing. Add SA, reduce Disp, to increase the value. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM76:  (Label8.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM76(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Usually calculated with 100% jib and not 150 genoa.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM77:  (Label10.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM77(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Potential maximum speed divided by hull speed. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM78:  (Label10.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM78(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("Underpowered or heavy vessels will be less than 1.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM79:  (Label10.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM79(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Lots of sail and light displacement boats  > 1. ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM8:  (HullSpeedTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM8(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgHullSpeed());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM80:  (LengthWaterLineTextField.text.textValueChanged(java.awt.event.TextEvent) --> CalcRatios1.hullSpeed)
 * @param arg1 java.awt.event.TextEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM80(java.awt.event.TextEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getCalcRatios1().setHullSpeed(0.0);
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM81:  (Label7.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM81(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Derived from the speed of a wave under gravity forces.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM82:  (Label7.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM82(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("Planing requires exceeding this speed. When above  ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM83:  (Label7.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM83(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("this speed the wave form created by the hull flattens.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM84:  (Label1.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM84(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Length at water line. This length will change when ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM85:  (Label1.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM85(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("the vessel heels and when weight is distributed so that");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM86:  (Label1.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM86(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("there is bow lift.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM87:  (Label2.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM87(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Provides power. The area is increased by hanking on");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM88:  (Label2.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM88(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("head sails of different shapes and by unfurling. It is de-");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM89:  (Label2.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM89(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("creased in fresh and heavy wind by reefing and furling.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM9:  (SailAreaDispRatioTextField.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line1CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM9(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField1().setText(getCalcRatios1().getMsgSailAreaDispRatio());
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM90:  (Label3.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM90(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Lightest weight of the vessel with ballast unless ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM91:  (Label3.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM91(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("ocean cruising. Then displacement is the weight at ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM92:  (Label3.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM92(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("the half way point of the passage.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM93:  (Label4.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM93(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Water, fuel or other liquid and solids secured low in ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM94:  (Label4.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM94(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("the vessel for stability purposes. Balllast can but ");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM95:  (Label4.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM95(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("need not be tacked onto a keel. It must not shift.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM96:  (Label5.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM96(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("Widest part of the vessel. Note that the shape of the");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM97:  (Label5.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line4CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM97(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField3().setText("hull determines the beam when leaning.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM98:  (Label5.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line3CommentTextField.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM98(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField4().setText("Recovery from capsize is hindered by large values.");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connEtoM99:  (Label6.mouse.mouseEntered(java.awt.event.MouseEvent) --> Line2CommentTextField1.text)
 * @param arg1 java.awt.event.MouseEvent
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connEtoM99(java.awt.event.MouseEvent arg1) {
	try {
		// user code begin {1}
		// user code end
		getTextField2().setText("The overall length of the vessel. When a sail boat");
		// user code begin {2}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP10SetTarget:  (CalcRatios1.dispLengthRatio <--> DispLengthRatioTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP10SetTarget() {
	/* Set the target from the source */
	try {
		getDispLengthRatioTextField().setText(String.valueOf(getCalcRatios1().getDispLengthRatio()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP11SetTarget:  (CalcRatios1.ballastDisp <--> BallastDispTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP11SetTarget() {
	/* Set the target from the source */
	try {
		getBallastDispTextField().setText(String.valueOf(getCalcRatios1().getBallastDisp()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP12SetTarget:  (CalcRatios1.loaBeamRatio <--> LOABeamTestField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP12SetTarget() {
	/* Set the target from the source */
	try {
		getLOABeamTestField().setText(String.valueOf(getCalcRatios1().getLoaBeamRatio()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP13SetTarget:  (CalcRatios1.capsizeRisk <--> CapsizeRiskTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP13SetTarget() {
	/* Set the target from the source */
	try {
		getCapsizeRiskTextField().setText(String.valueOf(getCalcRatios1().getCapsizeRisk()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP14SetTarget:  (CalcRatios1.hullSpeed <--> HullSpeedTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP14SetTarget() {
	/* Set the target from the source */
	try {
		getHullSpeedTextField().setText(String.valueOf(getCalcRatios1().getHullSpeed()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP15SetTarget:  (CalcRatios1.comfortFactor <--> ComfortFactorTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP15SetTarget() {
	/* Set the target from the source */
	try {
		getComfortFactorTextField().setText(String.valueOf(getCalcRatios1().getComfortFactor()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP1SetSource:  (LengthWaterLineTextField.text <--> CalcRatios1.lengthWaterLine)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP1SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP1Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP1Aligning = true;
			getLengthWaterLineTextField().setText(String.valueOf(getCalcRatios1().getLengthWaterLine()));
			// user code begin {2}
			// user code end
			ivjConnPtoP1Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP1Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP1SetTarget:  (LengthWaterLineTextField.text <--> CalcRatios1.lengthWaterLine)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP1SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP1Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP1Aligning = true;
			getCalcRatios1().setLengthWaterLine(new Double(getLengthWaterLineTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP1Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP1Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP2SetSource:  (SailAreaTextField.text <--> CalcRatios1.sailArea)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP2SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP2Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP2Aligning = true;
			getSailAreaTextField().setText(String.valueOf(getCalcRatios1().getSailArea()));
			// user code begin {2}
			// user code end
			ivjConnPtoP2Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP2Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP2SetTarget:  (SailAreaTextField.text <--> CalcRatios1.sailArea)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP2SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP2Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP2Aligning = true;
			getCalcRatios1().setSailArea(new Double(getSailAreaTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP2Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP2Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP3SetSource:  (DisplacementTextField.text <--> CalcRatios1.displacement)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP3SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP3Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP3Aligning = true;
			getDisplacementTextField().setText(String.valueOf(getCalcRatios1().getDisplacement()));
			// user code begin {2}
			// user code end
			ivjConnPtoP3Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP3Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP3SetTarget:  (DisplacementTextField.text <--> CalcRatios1.displacement)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP3SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP3Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP3Aligning = true;
			getCalcRatios1().setDisplacement(new Double(getDisplacementTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP3Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP3Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP4SetSource:  (BallastTextField.text <--> CalcRatios1.ballast)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP4SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP4Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP4Aligning = true;
			getBallastTextField().setText(String.valueOf(getCalcRatios1().getBallast()));
			// user code begin {2}
			// user code end
			ivjConnPtoP4Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP4Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP4SetTarget:  (BallastTextField.text <--> CalcRatios1.ballast)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP4SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP4Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP4Aligning = true;
			getCalcRatios1().setBallast(new Double(getBallastTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP4Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP4Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP5SetSource:  (BeamTextField.text <--> CalcRatios1.beam)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP5SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP5Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP5Aligning = true;
			getBeamTextField().setText(String.valueOf(getCalcRatios1().getBeam()));
			// user code begin {2}
			// user code end
			ivjConnPtoP5Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP5Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP5SetTarget:  (BeamTextField.text <--> CalcRatios1.beam)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP5SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP5Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP5Aligning = true;
			getCalcRatios1().setBeam(new Double(getBeamTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP5Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP5Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP6SetSource:  (LengthOverAllTextField.text <--> CalcRatios1.lengthOverAll)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP6SetSource() {
	/* Set the source from the target */
	try {
		if (ivjConnPtoP6Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP6Aligning = true;
			getLengthOverAllTextField().setText(String.valueOf(getCalcRatios1().getLengthOverAll()));
			// user code begin {2}
			// user code end
			ivjConnPtoP6Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP6Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP6SetTarget:  (LengthOverAllTextField.text <--> CalcRatios1.lengthOverAll)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP6SetTarget() {
	/* Set the target from the source */
	try {
		if (ivjConnPtoP6Aligning == false) {
			// user code begin {1}
			// user code end
			ivjConnPtoP6Aligning = true;
			getCalcRatios1().setLengthOverAll(new Double(getLengthOverAllTextField().getText()).doubleValue());
			// user code begin {2}
			// user code end
			ivjConnPtoP6Aligning = false;
		}
	} catch (java.lang.Throwable ivjExc) {
		ivjConnPtoP6Aligning = false;
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP7SetTarget:  (CalcRatios1.hullSpeed <--> HullSpeedTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP7SetTarget() {
	/* Set the target from the source */
	try {
		getHullSpeedTextField().setText(String.valueOf(getCalcRatios1().getHullSpeed()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP8SetTarget:  (CalcRatios1.velocityRatio <--> VelocityRatioTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP8SetTarget() {
	/* Set the target from the source */
	try {
		getVelocityRatioTextField().setText(String.valueOf(getCalcRatios1().getVelocityRatio()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * connPtoP9SetTarget:  (CalcRatios1.sailAreaDispRatio <--> SailAreaDispRatioTextField.text)
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void connPtoP9SetTarget() {
	/* Set the target from the source */
	try {
		getSailAreaDispRatioTextField().setText(String.valueOf(getCalcRatios1().getSailAreaDispRatio()));
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {3}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * Comment
 */
public void displacementTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
/**
 * Returns information about this applet.
 * @return a string of information about this applet
 */
public String getAppletInfo() {
	return "CalcRatiosApplet\n" + 
		"\n" + 
		"Insert the type's description here.\n" + 
		"Creation date: (9/18/2001 4:10:25 PM)\n" + 
		"@author: Frank Mighetto\n" + 
		"";
}
/**
 * Return the TextField11 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getBallastDispTextField() {
	if (ivjBallastDispTextField == null) {
		try {
			ivjBallastDispTextField = new java.awt.TextField();
			ivjBallastDispTextField.setName("BallastDispTextField");
			ivjBallastDispTextField.setBounds(182, 92, 75, 17);
			ivjBallastDispTextField.setEditable(false);
			ivjBallastDispTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjBallastDispTextField;
}
/**
 * Return the BallastTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getBallastTextField() {
	if (ivjBallastTextField == null) {
		try {
			ivjBallastTextField = new java.awt.TextField();
			ivjBallastTextField.setName("BallastTextField");
			ivjBallastTextField.setBounds(95, 92, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjBallastTextField;
}
/**
 * Return the BeamTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getBeamTextField() {
	if (ivjBeamTextField == null) {
		try {
			ivjBeamTextField = new java.awt.TextField();
			ivjBeamTextField.setName("BeamTextField");
			ivjBeamTextField.setBounds(95, 116, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjBeamTextField;
}
/**
 * Return the BlankTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getBlankTextField() {
	if (ivjBlankTextField == null) {
		try {
			ivjBlankTextField = new java.awt.TextField();
			ivjBlankTextField.setName("BlankTextField");
			ivjBlankTextField.setBounds(781, 534, 105, 29);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjBlankTextField;
}
/**
 * Return the CalcRatios1 property value.
 * @return ch11.CalcRatios
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private CalcRatios getCalcRatios1() {
	if (ivjCalcRatios1 == null) {
		try {
			ivjCalcRatios1 = new ch11.CalcRatios();
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjCalcRatios1;
}
/**
 * Return the CalcRatiosButton property value.
 * @return java.awt.Button
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Button getCalcRatiosButton() {
	if (ivjCalcRatiosButton == null) {
		try {
			ivjCalcRatiosButton = new java.awt.Button();
			ivjCalcRatiosButton.setName("CalcRatiosButton");
			ivjCalcRatiosButton.setBounds(19, 270, 56, 23);
			ivjCalcRatiosButton.setLabel("Calculate");
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjCalcRatiosButton;
}
/**
 * Return the TextField14 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getCapsizeRiskTextField() {
	if (ivjCapsizeRiskTextField == null) {
		try {
			ivjCapsizeRiskTextField = new java.awt.TextField();
			ivjCapsizeRiskTextField.setName("CapsizeRiskTextField");
			ivjCapsizeRiskTextField.setBounds(182, 159, 75, 17);
			ivjCapsizeRiskTextField.setEditable(false);
			ivjCapsizeRiskTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjCapsizeRiskTextField;
}
/**
 * Return the Comfort property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getComfort() {
	if (ivjComfort == null) {
		try {
			ivjComfort = new java.awt.Label();
			ivjComfort.setName("Comfort");
			ivjComfort.setText("Comfort");
			ivjComfort.setBounds(272, 116, 74, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjComfort;
}
/**
 * Return the ComfortFactorTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getComfortFactorTextField() {
	if (ivjComfortFactorTextField == null) {
		try {
			ivjComfortFactorTextField = new java.awt.TextField();
			ivjComfortFactorTextField.setName("ComfortFactorTextField");
			ivjComfortFactorTextField.setBounds(182, 116, 75, 17);
			ivjComfortFactorTextField.setEnabled(true);
			ivjComfortFactorTextField.setEditable(false);
			ivjComfortFactorTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjComfortFactorTextField;
}
/**
 * Return the DisplacementTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getDisplacementTextField() {
	if (ivjDisplacementTextField == null) {
		try {
			ivjDisplacementTextField = new java.awt.TextField();
			ivjDisplacementTextField.setName("DisplacementTextField");
			ivjDisplacementTextField.setBounds(95, 71, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjDisplacementTextField;
}
/**
 * Return the TextField10 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getDispLengthRatioTextField() {
	if (ivjDispLengthRatioTextField == null) {
		try {
			ivjDispLengthRatioTextField = new java.awt.TextField();
			ivjDispLengthRatioTextField.setName("DispLengthRatioTextField");
			ivjDispLengthRatioTextField.setBounds(182, 71, 75, 17);
			ivjDispLengthRatioTextField.setEditable(false);
			ivjDispLengthRatioTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjDispLengthRatioTextField;
}
/**
 * Return the HullSpeedTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getHullSpeedTextField() {
	if (ivjHullSpeedTextField == null) {
		try {
			ivjHullSpeedTextField = new java.awt.TextField();
			ivjHullSpeedTextField.setName("HullSpeedTextField");
			ivjHullSpeedTextField.setBounds(95, 159, 75, 17);
			ivjHullSpeedTextField.setEditable(false);
			ivjHullSpeedTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjHullSpeedTextField;
}
/**
 * Return the Label1 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel1() {
	if (ivjLabel1 == null) {
		try {
			ivjLabel1 = new java.awt.Label();
			ivjLabel1.setName("Label1");
			ivjLabel1.setAlignment(java.awt.Label.RIGHT);
			ivjLabel1.setText("LWL");
			ivjLabel1.setBounds(23, 31, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel1;
}
/**
 * Return the Label10 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel10() {
	if (ivjLabel10 == null) {
		try {
			ivjLabel10 = new java.awt.Label();
			ivjLabel10.setName("Label10");
			ivjLabel10.setText("Velocity");
			ivjLabel10.setBounds(272, 31, 59, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel10;
}
/**
 * Return the Label11 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel11() {
	if (ivjLabel11 == null) {
		try {
			ivjLabel11 = new java.awt.Label();
			ivjLabel11.setName("Label11");
			ivjLabel11.setText("Ballast/Disp");
			ivjLabel11.setBounds(272, 92, 74, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel11;
}
/**
 * Return the Label12 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel12() {
	if (ivjLabel12 == null) {
		try {
			ivjLabel12 = new java.awt.Label();
			ivjLabel12.setName("Label12");
			ivjLabel12.setText("LOA/Beam");
			ivjLabel12.setBounds(272, 136, 59, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel12;
}
/**
 * Return the Label13 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel13() {
	if (ivjLabel13 == null) {
		try {
			ivjLabel13 = new java.awt.Label();
			ivjLabel13.setName("Label13");
			ivjLabel13.setText("Cap Risk");
			ivjLabel13.setBounds(272, 159, 59, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel13;
}
/**
 * Return the Label14 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel14() {
	if (ivjLabel14 == null) {
		try {
			ivjLabel14 = new java.awt.Label();
			ivjLabel14.setName("Label14");
			ivjLabel14.setText("to Mac26x Specificatons");
			ivjLabel14.setBounds(207, 269, 131, 23);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel14;
}
/**
 * Return the Label2 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel2() {
	if (ivjLabel2 == null) {
		try {
			ivjLabel2 = new java.awt.Label();
			ivjLabel2.setName("Label2");
			ivjLabel2.setAlignment(java.awt.Label.RIGHT);
			ivjLabel2.setText("SA");
			ivjLabel2.setBounds(23, 51, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel2;
}
/**
 * Return the Label3 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel3() {
	if (ivjLabel3 == null) {
		try {
			ivjLabel3 = new java.awt.Label();
			ivjLabel3.setName("Label3");
			ivjLabel3.setAlignment(java.awt.Label.RIGHT);
			ivjLabel3.setText("Disp");
			ivjLabel3.setBounds(23, 71, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel3;
}
/**
 * Return the Label4 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel4() {
	if (ivjLabel4 == null) {
		try {
			ivjLabel4 = new java.awt.Label();
			ivjLabel4.setName("Label4");
			ivjLabel4.setAlignment(java.awt.Label.RIGHT);
			ivjLabel4.setText("Ballast");
			ivjLabel4.setBounds(23, 92, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel4;
}
/**
 * Return the Label5 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel5() {
	if (ivjLabel5 == null) {
		try {
			ivjLabel5 = new java.awt.Label();
			ivjLabel5.setName("Label5");
			ivjLabel5.setAlignment(java.awt.Label.RIGHT);
			ivjLabel5.setText("Beam");
			ivjLabel5.setBounds(23, 116, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel5;
}
/**
 * Return the Label6 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel6() {
	if (ivjLabel6 == null) {
		try {
			ivjLabel6 = new java.awt.Label();
			ivjLabel6.setName("Label6");
			ivjLabel6.setAlignment(java.awt.Label.RIGHT);
			ivjLabel6.setText("LOA");
			ivjLabel6.setBounds(23, 136, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel6;
}
/**
 * Return the Label7 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel7() {
	if (ivjLabel7 == null) {
		try {
			ivjLabel7 = new java.awt.Label();
			ivjLabel7.setName("Label7");
			ivjLabel7.setAlignment(java.awt.Label.RIGHT);
			ivjLabel7.setText("Hull Speed");
			ivjLabel7.setBounds(11, 159, 64, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel7;
}
/**
 * Return the Label8 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel8() {
	if (ivjLabel8 == null) {
		try {
			ivjLabel8 = new java.awt.Label();
			ivjLabel8.setName("Label8");
			ivjLabel8.setText("SA/Disp");
			ivjLabel8.setBounds(272, 51, 52, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel8;
}
/**
 * Return the Label9 property value.
 * @return java.awt.Label
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Label getLabel9() {
	if (ivjLabel9 == null) {
		try {
			ivjLabel9 = new java.awt.Label();
			ivjLabel9.setName("Label9");
			ivjLabel9.setText("Disp/Length");
			ivjLabel9.setBounds(272, 71, 77, 18);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLabel9;
}
/**
 * Return the LengthOverAllTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getLengthOverAllTextField() {
	if (ivjLengthOverAllTextField == null) {
		try {
			ivjLengthOverAllTextField = new java.awt.TextField();
			ivjLengthOverAllTextField.setName("LengthOverAllTextField");
			ivjLengthOverAllTextField.setBounds(95, 137, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLengthOverAllTextField;
}
/**
 * Return the LengthWaterLineTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getLengthWaterLineTextField() {
	if (ivjLengthWaterLineTextField == null) {
		try {
			ivjLengthWaterLineTextField = new java.awt.TextField();
			ivjLengthWaterLineTextField.setName("LengthWaterLineTextField");
			ivjLengthWaterLineTextField.setBounds(95, 31, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLengthWaterLineTextField;
}
/**
 * Return the TextField13 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getLOABeamTestField() {
	if (ivjLOABeamTestField == null) {
		try {
			ivjLOABeamTestField = new java.awt.TextField();
			ivjLOABeamTestField.setName("LOABeamTestField");
			ivjLOABeamTestField.setBounds(182, 137, 75, 17);
			ivjLOABeamTestField.setEditable(false);
			ivjLOABeamTestField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjLOABeamTestField;
}
/**
 * Gets the msgCR2 property (java.lang.String) value.
 * @return The msgCR2 property value.
 */
public java.lang.String getMsgCR2() {
	return fieldMsgCR2;
}
/**
 * Return the ResetButton property value.
 * @return java.awt.Button
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.Button getResetButton() {
	if (ivjResetButton == null) {
		try {
			ivjResetButton = new java.awt.Button();
			ivjResetButton.setName("ResetButton");
			ivjResetButton.setBounds(145, 270, 56, 23);
			ivjResetButton.setLabel("Reset");
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjResetButton;
}
/**
 * Return the TextField9 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getSailAreaDispRatioTextField() {
	if (ivjSailAreaDispRatioTextField == null) {
		try {
			ivjSailAreaDispRatioTextField = new java.awt.TextField();
			ivjSailAreaDispRatioTextField.setName("SailAreaDispRatioTextField");
			ivjSailAreaDispRatioTextField.setBounds(182, 51, 75, 17);
			ivjSailAreaDispRatioTextField.setEditable(false);
			ivjSailAreaDispRatioTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjSailAreaDispRatioTextField;
}
/**
 * Return the SailAreaTextField property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getSailAreaTextField() {
	if (ivjSailAreaTextField == null) {
		try {
			ivjSailAreaTextField = new java.awt.TextField();
			ivjSailAreaTextField.setName("SailAreaTextField");
			ivjSailAreaTextField.setBounds(95, 51, 75, 17);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjSailAreaTextField;
}
/**
 * Return the TextField1 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getTextField1() {
	if (ivjTextField1 == null) {
		try {
			ivjTextField1 = new java.awt.TextField();
			ivjTextField1.setName("TextField1");
			ivjTextField1.setBounds(18, 183, 325, 18);
			ivjTextField1.setEditable(false);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjTextField1;
}
/**
 * Return the TextField2 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getTextField2() {
	if (ivjTextField2 == null) {
		try {
			ivjTextField2 = new java.awt.TextField();
			ivjTextField2.setName("TextField2");
			ivjTextField2.setBounds(18, 205, 325, 18);
			ivjTextField2.setEditable(false);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjTextField2;
}
/**
 * Return the TextField3 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getTextField3() {
	if (ivjTextField3 == null) {
		try {
			ivjTextField3 = new java.awt.TextField();
			ivjTextField3.setName("TextField3");
			ivjTextField3.setBounds(18, 225, 325, 18);
			ivjTextField3.setEditable(false);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjTextField3;
}
/**
 * Return the TextField4 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getTextField4() {
	if (ivjTextField4 == null) {
		try {
			ivjTextField4 = new java.awt.TextField();
			ivjTextField4.setName("TextField4");
			ivjTextField4.setBounds(18, 247, 325, 18);
			ivjTextField4.setEditable(false);
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjTextField4;
}
/**
 * Return the TextField12 property value.
 * @return java.awt.TextField
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private java.awt.TextField getVelocityRatioTextField() {
	if (ivjVelocityRatioTextField == null) {
		try {
			ivjVelocityRatioTextField = new java.awt.TextField();
			ivjVelocityRatioTextField.setName("VelocityRatioTextField");
			ivjVelocityRatioTextField.setBounds(182, 31, 75, 17);
			ivjVelocityRatioTextField.setEditable(false);
			ivjVelocityRatioTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			// user code begin {1}
			// user code end
		} catch (java.lang.Throwable ivjExc) {
			// user code begin {2}
			// user code end
			handleException(ivjExc);
		}
	}
	return ivjVelocityRatioTextField;
}
/**
 * Called whenever the part throws an exception.
 * @param exception java.lang.Throwable
 */
private void handleException(java.lang.Throwable exception) {

	/* Uncomment the following lines to print uncaught exceptions to stdout */
	// System.out.println("--------- UNCAUGHT EXCEPTION ---------");
	// exception.printStackTrace(System.out);
}
/**
 * Initializes the applet.
 */
public void init() {
	try {
		super.init();
		setName("CalcRatiosApplet");
		setLayout(null);
		setSize(358, 301);
		add(getLabel1(), getLabel1().getName());
		add(getLabel2(), getLabel2().getName());
		add(getLabel3(), getLabel3().getName());
		add(getLabel4(), getLabel4().getName());
		add(getLabel5(), getLabel5().getName());
		add(getLabel6(), getLabel6().getName());
		add(getLabel7(), getLabel7().getName());
		add(getLabel8(), getLabel8().getName());
		add(getLabel9(), getLabel9().getName());
		add(getLabel10(), getLabel10().getName());
		add(getLabel11(), getLabel11().getName());
		add(getLabel12(), getLabel12().getName());
		add(getLabel13(), getLabel13().getName());
		add(getLengthWaterLineTextField(), getLengthWaterLineTextField().getName());
		add(getSailAreaTextField(), getSailAreaTextField().getName());
		add(getDisplacementTextField(), getDisplacementTextField().getName());
		add(getBallastTextField(), getBallastTextField().getName());
		add(getBeamTextField(), getBeamTextField().getName());
		add(getLengthOverAllTextField(), getLengthOverAllTextField().getName());
		add(getHullSpeedTextField(), getHullSpeedTextField().getName());
		add(getVelocityRatioTextField(), getVelocityRatioTextField().getName());
		add(getSailAreaDispRatioTextField(), getSailAreaDispRatioTextField().getName());
		add(getDispLengthRatioTextField(), getDispLengthRatioTextField().getName());
		add(getBallastDispTextField(), getBallastDispTextField().getName());
		add(getComfortFactorTextField(), getComfortFactorTextField().getName());
		add(getLOABeamTestField(), getLOABeamTestField().getName());
		add(getCapsizeRiskTextField(), getCapsizeRiskTextField().getName());
		add(getCalcRatiosButton(), getCalcRatiosButton().getName());
		add(getResetButton(), getResetButton().getName());
		add(getTextField1(), getTextField1().getName());
		add(getTextField2(), getTextField2().getName());
		add(getTextField3(), getTextField3().getName());
		add(getTextField4(), getTextField4().getName());
		add(getLabel14(), getLabel14().getName());
		add(getComfort(), getComfort().getName());
		initConnections();
		connEtoM1();
		connEtoM3();
		connEtoM4();
		connEtoM50();
		connEtoM51();
		connEtoM52();
		// user code begin {1}
		// user code end
	} catch (java.lang.Throwable ivjExc) {
		// user code begin {2}
		// user code end
		handleException(ivjExc);
	}
}
/**
 * Initializes connections
 * @exception java.lang.Exception The exception description.
 */
/* WARNING: THIS METHOD WILL BE REGENERATED. */
private void initConnections() throws java.lang.Exception {
	// user code begin {1}
	// user code end
	getHullSpeedTextField().addMouseListener(ivjEventHandler);
	getVelocityRatioTextField().addMouseListener(ivjEventHandler);
	getCapsizeRiskTextField().addMouseListener(ivjEventHandler);
	getBallastDispTextField().addMouseListener(ivjEventHandler);
	getDispLengthRatioTextField().addMouseListener(ivjEventHandler);
	getSailAreaDispRatioTextField().addMouseListener(ivjEventHandler);
	getLOABeamTestField().addMouseListener(ivjEventHandler);
	getCalcRatios1().addPropertyChangeListener(ivjEventHandler);
	getCalcRatiosButton().addActionListener(ivjEventHandler);
	getLengthWaterLineTextField().addTextListener(ivjEventHandler);
	getSailAreaTextField().addTextListener(ivjEventHandler);
	getDisplacementTextField().addTextListener(ivjEventHandler);
	getBallastTextField().addTextListener(ivjEventHandler);
	getBeamTextField().addTextListener(ivjEventHandler);
	getLengthOverAllTextField().addTextListener(ivjEventHandler);
	getLabel13().addMouseListener(ivjEventHandler);
	getLabel12().addMouseListener(ivjEventHandler);
	getLabel11().addMouseListener(ivjEventHandler);
	getLabel9().addMouseListener(ivjEventHandler);
	getLabel8().addMouseListener(ivjEventHandler);
	getLabel10().addMouseListener(ivjEventHandler);
	getLabel7().addMouseListener(ivjEventHandler);
	getLabel1().addMouseListener(ivjEventHandler);
	getLabel2().addMouseListener(ivjEventHandler);
	getLabel3().addMouseListener(ivjEventHandler);
	getLabel4().addMouseListener(ivjEventHandler);
	getLabel5().addMouseListener(ivjEventHandler);
	getLabel6().addMouseListener(ivjEventHandler);
	getResetButton().addActionListener(ivjEventHandler);
	getLengthWaterLineTextField().addMouseListener(ivjEventHandler);
	getDisplacementTextField().addMouseListener(ivjEventHandler);
	getBallastTextField().addMouseListener(ivjEventHandler);
	getBeamTextField().addMouseListener(ivjEventHandler);
	getLengthOverAllTextField().addMouseListener(ivjEventHandler);
	getSailAreaTextField().addMouseListener(ivjEventHandler);
	getComfort().addMouseListener(ivjEventHandler);
	getComfortFactorTextField().addMouseListener(ivjEventHandler);
	getLengthWaterLineTextField().addKeyListener(ivjEventHandler);
	getSailAreaTextField().addKeyListener(ivjEventHandler);
	getDisplacementTextField().addKeyListener(ivjEventHandler);
	getBallastTextField().addKeyListener(ivjEventHandler);
	getBeamTextField().addKeyListener(ivjEventHandler);
	getLengthOverAllTextField().addKeyListener(ivjEventHandler);
	connPtoP7SetTarget();
	connPtoP8SetTarget();
	connPtoP9SetTarget();
	connPtoP10SetTarget();
	connPtoP11SetTarget();
	connPtoP12SetTarget();
	connPtoP13SetTarget();
	connPtoP1SetTarget();
	connPtoP2SetTarget();
	connPtoP3SetTarget();
	connPtoP4SetTarget();
	connPtoP5SetTarget();
	connPtoP6SetTarget();
	connPtoP14SetTarget();
	connPtoP15SetTarget();
}
/**
 * Called when a key has been pressed.
 * @param e the received event
 */
public void keyPressed(KeyEvent e) {
	System.out.println("keyPressed");
}
/**
 * Called when a key has been released.
 * @param e the received event
 */
public void keyReleased(KeyEvent e) {
	System.out.println("keyReleased");
}
/**
 * Called when a key has been typed.
 * @param e the received event
 */
public void keyTyped(KeyEvent e) {
	System.out.println("keyTyped");
}
/**
 * Comment
 */
public void label12_FocusEvents() {
	setForeground(Color.red);
	return;
}
/**
 * Comment
 */
public void lengthOverAllTextField_Background(java.awt.Color arg1) {
	return;
}
/**
 * Comment
 */
public void lengthOverAllTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
/**
 * Comment
 */
public void lengthWaterLineTextField_FocusLost(java.awt.event.FocusEvent focusEvent) {
	return;
}
/**
 * Comment
 */
public void lengthWaterLineTextField_FocusLost1(java.awt.event.FocusEvent focusEvent) {
	return;
}
/**
 * Comment
 */
public void lengthWaterLineTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
/**
 * Comment
 */
public void lOABeamTestField_FocusEvents() {
	setForeground(Color.red);
	return;
}
/**
 * main entrypoint - starts the part when it is run as an application
 * @param args java.lang.String[]
 */
public static void main(java.lang.String[] args) {
	try {
		Frame frame = new java.awt.Frame();
		CalcRatiosApplet aCalcRatiosApplet;
		Class iiCls = Class.forName("ch11.CalcRatiosApplet");
		ClassLoader iiClsLoader = iiCls.getClassLoader();
		aCalcRatiosApplet = (CalcRatiosApplet)java.beans.Beans.instantiate(iiClsLoader,"ch11.CalcRatiosApplet");
		frame.add("Center", aCalcRatiosApplet);
		frame.setSize(aCalcRatiosApplet.getSize());
		frame.addWindowListener(new java.awt.event.WindowAdapter() {
			public void windowClosing(java.awt.event.WindowEvent e) {
				System.exit(0);
			};
		});
		frame.show();
		java.awt.Insets insets = frame.getInsets();
		frame.setSize(frame.getWidth() + insets.left + insets.right, frame.getHeight() + insets.top + insets.bottom);
		frame.setVisible(true);
	} catch (Throwable exception) {
		System.err.println("Exception occurred in main() of java.applet.Applet");
		exception.printStackTrace(System.out);
	}
}
/**
 * Called when the mouse has been clicked.
 * @param e the received event
 */
public void mouseClicked(MouseEvent e) {
	System.out.println("mouseClicked");
}
/**
 * Called when the mouse has entered a window.
 * @param e the received event
 */
public void mouseEntered(MouseEvent e) {
	System.out.println("mouseEntered");

}
/**
 * Called when the mouse has exited a window.
 * @param e the received event
 */
public void mouseExited(MouseEvent e) {
	System.out.println("mouseExited");
}
/**
 * Called when a mouse button has been pressed.
 * @param e the received event
 */
public void mousePressed(MouseEvent e) {
	System.out.println("mousePressed");
}
/**
 * Called when a mouse button has been released.
 * @param e the received event
 */
public void mouseReleased(MouseEvent e) {
	System.out.println("mouseReleased");
}
/**
 * Paints the applet.
 * If the applet does not need to be painted (e.g. if it is only a container for other
 * awt components) then this method can be safely removed.
 * 
 * @param g  the specified Graphics window
 * @see #update
 */
public void paint(Graphics g) {
	super.paint(g);

	// insert code to paint the applet here
}
/**
 * Comment
 */
public void resetButton_ActionEvents() {
	return;
}
/**
 * Comment
 */
public void resetButton_ActionEvents1() {
	double ballast = 23;
	return;
}
/**
 * Comment
 */
public void sailAreaTextField_KeyPressed(java.awt.event.KeyEvent keyEvent) {
	char key = keyEvent.getKeyChar();
	/* positive number keys and . only */
	if ( key > 32 && key < 46 ) { keyEvent.consume(); };
	if ( key > 46 && key < 48 ) { keyEvent.consume(); };
	if ( key > 59 && key < 127 ) { keyEvent.consume(); };
	if ( key > 161 ) { keyEvent.consume(); };
	return;
}
}
