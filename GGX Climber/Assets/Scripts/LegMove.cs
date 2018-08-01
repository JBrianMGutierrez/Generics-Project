using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LegMove : MonoBehaviour {

	public HingeJoint connectedJoint;
	public Transform target;
	public bool invertMovement;
    public Animator anim;
    // Use this for initialization
    void Start ()
    {
		
	}
	
	void Update () 
	{
        if (Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.S))
        {
            anim.SetBool("run", true);
            Walk();
        }
         else
        {
            anim.SetBool("run", false);
        }
	}

    void Walk ()
    {
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
