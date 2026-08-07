package ch11;

/**
 * Insert the type's description here.
 * Creation date: (9/18/2001 1:40:39 PM)
 * @author: Administrator
 */
public class CalcRatios {
	protected transient java.beans.PropertyChangeSupport propertyChange;
	private double fieldSailArea = 0;
	private double fieldDisplacement = 0;
	private double fieldLengthWaterLine = 0;
	private double fieldDispLengthRatio = 0;
	private double fieldSailAreaDispRatio = 0;
	private double fieldVelocityRatio = 0;
	private double fieldBallastDisp = 0;
	private double fieldLoaBeamRatio = 0;
	private double fieldCapsizeRisk = 0;
	private double fieldHullSpeed = 0;
	private double fieldBallast = 0;
	private double fieldBeam = 0;
	private java.lang.String fieldLine1Comment = new String();
	private java.lang.String fieldLine2Comment = new String();
	private java.lang.String fieldLine3Comment = new String();
	private java.lang.String fieldLine4Comment = new String();
	private double fieldLengthOverAll = 0;
	private java.lang.String fieldMsgDispLengthRatio = new String();
	private java.lang.String fieldMsgSailAreaDispRatio = new String();
	private java.lang.String fieldMsgHullSpeed = new String();
	private java.lang.String fieldMsgVelocityRatio = new String();
	private java.lang.String fieldMsgBallastDisp = new String();
	private java.lang.String fieldMsgLoaBeam = new String();
	private java.lang.String fieldMsgCapsizeRisk = new String();
	private double fieldComfortFactor = 0;
	private java.lang.String fieldMsgComfortFactor = new String();
/**
 * CalcRatios constructor comment.
 */
public CalcRatios() {
	super();
}
/**
 * The addPropertyChangeListener method was generated to support the propertyChange field.
 */
public synchronized void addPropertyChangeListener(java.beans.PropertyChangeListener listener) {
	getPropertyChange().addPropertyChangeListener(listener);
}
/**
 * The addPropertyChangeListener method was generated to support the propertyChange field.
 */
public synchronized void addPropertyChangeListener(java.lang.String propertyName, java.beans.PropertyChangeListener listener) {
	getPropertyChange().addPropertyChangeListener(propertyName, listener);
}
/**
 * Perform the ballastDisp method.
 */
public void ballastDisp() {
	/* Perform the ballastDisp method. */
	setBallastDisp(getBallast() / getDisplacement());
	return;
}
/**
 * Perform the capsizeRisk method.
 */
public void capsizeRisk() {
	/* Perform the capsizeRisk method. */
/*		setCapsizeRisk(getBeam()/
			java.lang.Math.pow((getDisplacement()/(.9*64)),.333) */
		setCapsizeRisk(
			getBeam()/
			java.lang.Math.pow((getDisplacement()/(.9*64)),.333)
			);
	return;
}
/**
 * Perform the comfortFactor method.
 */
public void comfortFactor() {
	/* Perform the comfortFactor method. */
			setComfortFactor(
			getDisplacement()/ 
				(.65* java.lang.Math.pow(getBeam(),1.333) *
					(.7*getLengthWaterLine()+.3*getLengthOverAll())
				)
			);
				    
			
		
	return;
}
/**
 * Perform the dispLengthRatio method.
 */
public void dispLengthRatio() {
	/* Perform the dispLengthRatio method. */
	setDispLengthRatio(getDisplacement() / 2240 / java.lang.Math.pow((.01 * getLengthWaterLine()),3.0));
}
/**
 * The firePropertyChange method was generated to support the propertyChange field.
 */
public void firePropertyChange(java.beans.PropertyChangeEvent evt) {
	getPropertyChange().firePropertyChange(evt);
}
/**
 * The firePropertyChange method was generated to support the propertyChange field.
 */
public void firePropertyChange(java.lang.String propertyName, int oldValue, int newValue) {
	getPropertyChange().firePropertyChange(propertyName, oldValue, newValue);
}
/**
 * The firePropertyChange method was generated to support the propertyChange field.
 */
public void firePropertyChange(java.lang.String propertyName, java.lang.Object oldValue, java.lang.Object newValue) {
	getPropertyChange().firePropertyChange(propertyName, oldValue, newValue);
}
/**
 * The firePropertyChange method was generated to support the propertyChange field.
 */
public void firePropertyChange(java.lang.String propertyName, boolean oldValue, boolean newValue) {
	getPropertyChange().firePropertyChange(propertyName, oldValue, newValue);
}
/**
 * Gets the ballast property (double) value.
 * @return The ballast property value.
 * @see #setBallast
 */
public double getBallast() {
	return fieldBallast;
}
/**
 * Gets the ballastDisp property (double) value.
 * @return The ballastDisp property value.
 * @see #setBallastDisp
 */
public double getBallastDisp() {
	return fieldBallastDisp;
}
/**
 * Gets the beam property (double) value.
 * @return The beam property value.
 * @see #setBeam
 */
public double getBeam() {
	return fieldBeam;
}
/**
 * Gets the capsizeRisk property (double) value.
 * @return The capsizeRisk property value.
 * @see #setCapsizeRisk
 */
public double getCapsizeRisk() {
	return fieldCapsizeRisk;
}
/**
 * Gets the comfortFactor property (double) value.
 * @return The comfortFactor property value.
 * @see #setComfortFactor
 */
public double getComfortFactor() {
	return fieldComfortFactor;
}
/**
 * Gets the displacement property (double) value.
 * @return The displacement property value.
 * @see #setDisplacement
 */
public double getDisplacement() {
	return fieldDisplacement;
}
/**
 * Gets the dispLengthRatio property (double) value.
 * @return The dispLengthRatio property value.
 * @see #setDispLengthRatio
 */
public double getDispLengthRatio() {
	return fieldDispLengthRatio;
}
/**
 * Gets the hullSpeed property (double) value.
 * @return The hullSpeed property value.
 * @see #setHullSpeed
 */
public double getHullSpeed() {
	return fieldHullSpeed;
}
/**
 * Gets the lengthOverAll property (double) value.
 * @return The lengthOverAll property value.
 * @see #setLengthOverAll
 */
public double getLengthOverAll() {
	return fieldLengthOverAll;
}
/**
 * Gets the lengthWaterLine property (double) value.
 * @return The lengthWaterLine property value.
 * @see #setLengthWaterLine
 */
public double getLengthWaterLine() {
	return fieldLengthWaterLine;
}
/**
 * Gets the line1Comment property (java.lang.String) value.
 * @return The line1Comment property value.
 * @see #setLine1Comment
 */
public java.lang.String getLine1Comment() {
	return fieldLine1Comment;
}
/**
 * Gets the line2Comment property (java.lang.String) value.
 * @return The line2Comment property value.
 * @see #setLine2Comment
 */
public java.lang.String getLine2Comment() {
	return fieldLine2Comment;
}
/**
 * Gets the line3Comment property (java.lang.String) value.
 * @return The line3Comment property value.
 * @see #setLine3Comment
 */
public java.lang.String getLine3Comment() {
	return fieldLine3Comment;
}
/**
 * Gets the line4Comment property (java.lang.String) value.
 * @return The line4Comment property value.
 * @see #setLine4Comment
 */
public java.lang.String getLine4Comment() {
	return fieldLine4Comment;
}
/**
 * Gets the loaBeamRatio property (double) value.
 * @return The loaBeamRatio property value.
 * @see #setLoaBeamRatio
 */
public double getLoaBeamRatio() {
	return fieldLoaBeamRatio;
}
/**
 * Gets the msgBallastDisp property (java.lang.String) value.
 * @return The msgBallastDisp property value.
 */
public java.lang.String getMsgBallastDisp() {
/*	return fieldMsgBallastDisp; */
	return " = ballast / displacement ";
}
/**
 * Gets the msgCapsizeRisk property (java.lang.String) value.
 * @return The msgCapsizeRisk property value.
 */
public java.lang.String getMsgCapsizeRisk() {
/*	return fieldMsgCapsizeRisk; */
	return " Capsize Risk = beam / (disp / (.9*64))^.333";
}
/**
 * Gets the msgComfortFactor property (java.lang.String) value.
 * @return The msgComfortFactor property value.
 */
public java.lang.String getMsgComfortFactor() {
/*	return fieldMsgComfortFactor; */
return " disp / (.65*(.7*lwl+loa)*beam^1.33) ";
}
/**
 * Gets the msgDispLengthRatio property (java.lang.String) value.
 * @return The msgDispLengthRatio property value.
 */
public java.lang.String getMsgDispLengthRatio() {
	return "DispLength ratio = disp / 2240 / (.01 * lwl)^3";
}
/**
 * Gets the msgHullSpeed property (java.lang.String) value.
 * @return The msgHullSpeed property value.
 */
public java.lang.String getMsgHullSpeed() {
/*	return fieldMsgHullSpeed; */
	return " Hull Speed = 1.34 * lwl^5";
}
/**
 * Gets the msgLoaBeam property (java.lang.String) value.
 * @return The msgLoaBeam property value.
 */
public java.lang.String getMsgLoaBeam() {
/*	return fieldMsgLoaBeam; */
	return " = length over all / beam ";
}
/**
 * Gets the msgSailAreaDispRatio property (java.lang.String) value.
 * @return The msgSailAreaDispRatio property value.
 */
public java.lang.String getMsgSailAreaDispRatio() {
/*	return fieldMsgSailAreaDispRatio; */
	return " = sail area / (disp / 64)^.666";
}
/**
 * Gets the msgVelocityRatio property (java.lang.String) value.
 * @return The msgVelocityRatio property value.
 */
public java.lang.String getMsgVelocityRatio() {
/*	return fieldMsgVelocityRatio; */
	return " = 1.88*lwl^.5*sail area^.333/disp^.25/hull speed";
}
/**
 * Accessor for the propertyChange field.
 */
protected java.beans.PropertyChangeSupport getPropertyChange() {
	if (propertyChange == null) {
		propertyChange = new java.beans.PropertyChangeSupport(this);
	};
	return propertyChange;
}
/**
 * Gets the sailArea property (double) value.
 * @return The sailArea property value.
 * @see #setSailArea
 */
public double getSailArea() {
	return fieldSailArea;
}
/**
 * Gets the sailAreaDispRatio property (double) value.
 * @return The sailAreaDispRatio property value.
 * @see #setSailAreaDispRatio
 */
public double getSailAreaDispRatio() {
	return fieldSailAreaDispRatio;
}
/**
 * Gets the velocityRatio property (double) value.
 * @return The velocityRatio property value.
 * @see #setVelocityRatio
 */
public double getVelocityRatio() {
	return fieldVelocityRatio;
}
/**
 * The hasListeners method was generated to support the propertyChange field.
 */
public synchronized boolean hasListeners(java.lang.String propertyName) {
	return getPropertyChange().hasListeners(propertyName);
}
/**
 * Perform the hullSpeed method.
 */
public void hullSpeed() {
	/* Perform the hullSpeed method. */
	setHullSpeed(1.34 * java.lang.Math.sqrt(getLengthWaterLine()));
	return;
}
/**
 * Perform the line1Comment method.
 */
public void line1Comment() {
	/* Perform the line1Comment method. */
	return;
}
/**
 * Perform the loaBeamRatio method.
 */
public void loaBeamRatio() {
	/* Perform the loaBeamRatio method. */
	/*setLoaBeamRatio(getLengthWaterLine() / getBeam());*/
	setLoaBeamRatio(getLengthOverAll() / getBeam());
	return;
}
/**
 * Perform the msgDispLenthRatio method.
 */
public void msgDispLenthRatio() {
	/* Perform the msgDispLenthRatio method. */
	return;
}
/**
 * The removePropertyChangeListener method was generated to support the propertyChange field.
 */
public synchronized void removePropertyChangeListener(java.beans.PropertyChangeListener listener) {
	getPropertyChange().removePropertyChangeListener(listener);
}
/**
 * The removePropertyChangeListener method was generated to support the propertyChange field.
 */
public synchronized void removePropertyChangeListener(java.lang.String propertyName, java.beans.PropertyChangeListener listener) {
	getPropertyChange().removePropertyChangeListener(propertyName, listener);
}
/**
 * Perform the sailAreaDispRatio method.
 */
public void sailAreaDispRatio() {
	/* Perform the sailAreaDispRatio method. */
	setSailAreaDispRatio(getSailArea()/ (java.lang.Math.pow((getDisplacement()/64),.666)));
	return;
}
/**
 * Sets the ballast property (double) value.
 * @param ballast The new value for the property.
 * @see #getBallast
 */
public void setBallast(double ballast) {
	double oldValue = fieldBallast;
	fieldBallast = ballast;
	firePropertyChange("ballast", new Double(oldValue), new Double(ballast));
}
/**
 * Sets the ballastDisp property (double) value.
 * @param ballastDisp The new value for the property.
 * @see #getBallastDisp
 */
public void setBallastDisp(double ballastDisp) {
	double oldValue = fieldBallastDisp;
	fieldBallastDisp = ballastDisp;
	firePropertyChange("ballastDisp", new Double(oldValue), new Double(ballastDisp));
}
/**
 * Sets the beam property (double) value.
 * @param beam The new value for the property.
 * @see #getBeam
 */
public void setBeam(double beam) {
	double oldValue = fieldBeam;
	fieldBeam = beam;
	firePropertyChange("beam", new Double(oldValue), new Double(beam));
}
/**
 * Sets the capsizeRisk property (double) value.
 * @param capsizeRisk The new value for the property.
 * @see #getCapsizeRisk
 */
public void setCapsizeRisk(double capsizeRisk) {
	double oldValue = fieldCapsizeRisk;
	fieldCapsizeRisk = capsizeRisk;
	firePropertyChange("capsizeRisk", new Double(oldValue), new Double(capsizeRisk));
}
/**
 * Sets the comfortFactor property (double) value.
 * @param comfortFactor The new value for the property.
 * @see #getComfortFactor
 */
public void setComfortFactor(double comfortFactor) {
	double oldValue = fieldComfortFactor;
	fieldComfortFactor = comfortFactor;
	firePropertyChange("comfortFactor", new Double(oldValue), new Double(comfortFactor));
}
/**
 * Sets the displacement property (double) value.
 * @param displacement The new value for the property.
 * @see #getDisplacement
 */
public void setDisplacement(double displacement) {
	double oldValue = fieldDisplacement;
	fieldDisplacement = displacement;
	firePropertyChange("displacement", new Double(oldValue), new Double(displacement));
}
/**
 * Sets the dispLengthRatio property (double) value.
 * @param dispLengthRatio The new value for the property.
 * @see #getDispLengthRatio
 */
public void setDispLengthRatio(double dispLengthRatio) {
	double oldValue = fieldDispLengthRatio;
	fieldDispLengthRatio = dispLengthRatio;
	firePropertyChange("dispLengthRatio", new Double(oldValue), new Double(dispLengthRatio));
}
/**
 * Sets the hullSpeed property (double) value.
 * @param hullSpeed The new value for the property.
 * @see #getHullSpeed
 */
public void setHullSpeed(double hullSpeed) {
	double oldValue = fieldHullSpeed;
	fieldHullSpeed = hullSpeed;
	firePropertyChange("hullSpeed", new Double(oldValue), new Double(hullSpeed));
}
/**
 * Sets the lengthOverAll property (double) value.
 * @param lengthOverAll The new value for the property.
 * @see #getLengthOverAll
 */
public void setLengthOverAll(double lengthOverAll) {
	double oldValue = fieldLengthOverAll;
	fieldLengthOverAll = lengthOverAll;
	firePropertyChange("lengthOverAll", new Double(oldValue), new Double(lengthOverAll));
}
/**
 * Sets the lengthWaterLine property (double) value.
 * @param lengthWaterLine The new value for the property.
 * @see #getLengthWaterLine
 */
public void setLengthWaterLine(double lengthWaterLine) {
	double oldValue = fieldLengthWaterLine;
	fieldLengthWaterLine = lengthWaterLine;
	firePropertyChange("lengthWaterLine", new Double(oldValue), new Double(lengthWaterLine));
}
/**
 * Sets the line1Comment property (java.lang.String) value.
 * @param line1Comment The new value for the property.
 * @see #getLine1Comment
 */
public void setLine1Comment(java.lang.String line1Comment) {
	String oldValue = fieldLine1Comment;
	fieldLine1Comment = line1Comment;
	firePropertyChange("line1Comment", oldValue, line1Comment);
}
/**
 * Sets the line2Comment property (java.lang.String) value.
 * @param line2Comment The new value for the property.
 * @see #getLine2Comment
 */
public void setLine2Comment(java.lang.String line2Comment) {
	String oldValue = fieldLine2Comment;
	fieldLine2Comment = line2Comment;
	firePropertyChange("line2Comment", oldValue, line2Comment);
}
/**
 * Sets the line3Comment property (java.lang.String) value.
 * @param line3Comment The new value for the property.
 * @see #getLine3Comment
 */
public void setLine3Comment(java.lang.String line3Comment) {
	String oldValue = fieldLine3Comment;
	fieldLine3Comment = line3Comment;
	firePropertyChange("line3Comment", oldValue, line3Comment);
}
/**
 * Sets the line4Comment property (java.lang.String) value.
 * @param line4Comment The new value for the property.
 * @see #getLine4Comment
 */
public void setLine4Comment(java.lang.String line4Comment) {
	String oldValue = fieldLine4Comment;
	fieldLine4Comment = line4Comment;
	firePropertyChange("line4Comment", oldValue, line4Comment);
}
/**
 * Sets the loaBeamRatio property (double) value.
 * @param loaBeamRatio The new value for the property.
 * @see #getLoaBeamRatio
 */
public void setLoaBeamRatio(double loaBeamRatio) {
	double oldValue = fieldLoaBeamRatio;
	fieldLoaBeamRatio = loaBeamRatio;
	firePropertyChange("loaBeamRatio", new Double(oldValue), new Double(loaBeamRatio));
}
/**
 * Sets the sailArea property (double) value.
 * @param sailArea The new value for the property.
 * @see #getSailArea
 */
public void setSailArea(double sailArea) {
	double oldValue = fieldSailArea;
	fieldSailArea = sailArea;
	firePropertyChange("sailArea", new Double(oldValue), new Double(sailArea));
}
/**
 * Sets the sailAreaDispRatio property (double) value.
 * @param sailAreaDispRatio The new value for the property.
 * @see #getSailAreaDispRatio
 */
public void setSailAreaDispRatio(double sailAreaDispRatio) {
	double oldValue = fieldSailAreaDispRatio;
	fieldSailAreaDispRatio = sailAreaDispRatio;
	firePropertyChange("sailAreaDispRatio", new Double(oldValue), new Double(sailAreaDispRatio));
}
/**
 * Sets the velocityRatio property (double) value.
 * @param velocityRatio The new value for the property.
 * @see #getVelocityRatio
 */
public void setVelocityRatio(double velocityRatio) {
	double oldValue = fieldVelocityRatio;
	fieldVelocityRatio = velocityRatio;
	firePropertyChange("velocityRatio", new Double(oldValue), new Double(velocityRatio));
}
/**
 * Perform the velocityRatio method.
 */
public void velocityRatio() {
	setVelocityRatio(
		
		(1.88*java.lang.Math.pow(getLengthWaterLine(),.5)*
		java.lang.Math.pow(getSailArea(),.33)/
		java.lang.Math.pow(getDisplacement(),.25))/
(1.34 * java.lang.Math.sqrt(getLengthWaterLine())));	
	return;
}
}
