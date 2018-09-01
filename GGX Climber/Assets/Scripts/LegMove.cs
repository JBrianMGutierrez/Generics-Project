using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LegMove : MonoBehaviour {

	public HingeJoint connectedJoint;
	public Transform target;
	public bool invertMovement;
    public Animator anim;
	public int rotations = 180;
	public int movementSpread = 360;
    // Use this for initialization
    void Start ()
    {
		
	}
	
	void Update () 
	{

		if (Input.GetKey(KeyCode.W) || Input.GetKey (KeyCode.S)){
			Walk();
            anim.SetBool("run", true);

        } else {
            resetStance();
            anim.SetBool("run", false);
        }
		if (Input.GetKey (KeyCode.S))
        {
			anim.SetBool("backward", true);
		} else
        {
			anim.SetBool("backward", false);
		}
	}

    void Walk ()
    {
        JointSpring jointMovement = connectedJoint.spring;
        jointMovement.targetPosition = target.localEulerAngles.x;

		if (jointMovement.targetPosition > rotations) {
			jointMovement.targetPosition = jointMovement.targetPosition - movementSpread;
		}

        jointMovement.targetPosition = Mathf.Clamp(jointMovement.targetPosition, connectedJoint.limits.min + 5, connectedJoint.limits.max - 5);

        if (invertMovement)
        {
            jointMovement.targetPosition = jointMovement.targetPosition * -1;
        }
        connectedJoint.spring = jointMovement;
    }

    void resetStance()
    {
        JointSpring jointMovement = connectedJoint.spring;
        jointMovement.targetPosition = 10;
        connectedJoint.spring = jointMovement;
    }
}
