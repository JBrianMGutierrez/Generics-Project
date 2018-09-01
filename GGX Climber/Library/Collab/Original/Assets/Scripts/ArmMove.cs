using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArmMove : LegMove {

    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        ArmRaise();
	}

    void ArmRaise () {
        JointSpring jointMovement = connectedJoint.spring;
        jointMovement.targetPosition = target.localEulerAngles.x;
        if (jointMovement.targetPosition > 180)
            jointMovement.targetPosition = jointMovement.targetPosition - 360;
        jointMovement.targetPosition = Mathf.Clamp(jointMovement.targetPosition, connectedJoint.limits.min + 5, connectedJoint.limits.max - 5);
        if (invertMovement)
        {
            jointMovement.targetPosition = jointMovement.targetPosition * -1;
        }
        connectedJoint.spring = jointMovement;
    }
}
