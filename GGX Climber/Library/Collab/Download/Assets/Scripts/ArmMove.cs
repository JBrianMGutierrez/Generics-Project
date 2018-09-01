using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArmMove : LegMove {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (gameObject.name == "Right_Arm") {
			if (transform.rotation.z < 1 && transform.rotation.z < -1) {
				this.transform.localRotation = Quaternion.Euler (0, 0, -90);
			}
		}
		if (gameObject.name == "Left_Arm") {
			if (transform.rotation.z < 1 && transform.rotation.z < -1) {
				this.transform.localRotation = Quaternion.Euler (0, 0, 90);
			}
		}
		if (Input.GetMouseButtonDown (1)) {
			anim.SetBool ("armForward", false);
			ArmsForward ();
		}
		if (Input.GetMouseButtonUp (1))
		{
			anim.SetBool ("armForward", true);
			ArmsForward ();
		}
	}

	public void ArmsForward ()
	{
		JointSpring jointMovement = connectedJoint.spring;
		jointMovement.targetPosition = target.localEulerAngles.x;
		if (jointMovement.targetPosition > rotations)
			jointMovement.targetPosition = jointMovement.targetPosition - movementSpread;
		jointMovement.targetPosition = Mathf.Clamp(jointMovement.targetPosition, connectedJoint.limits.min + 5, connectedJoint.limits.max + 90);
		if (invertMovement)
		{
			jointMovement.targetPosition = jointMovement.targetPosition * -1;
		}
		connectedJoint.spring = jointMovement;
	}


}
