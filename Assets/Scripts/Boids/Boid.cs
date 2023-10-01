using System.Collections.Generic;
using UnityEngine;

namespace Winch.Boids
{
    public class Boid
    {
        public Topic<Vector3> Position { get; } = new Topic<Vector3>();
        public Topic<Vector3> Velocity { get; } = new Topic<Vector3>();
        public Topic<Vector3> Acceleration { get; } = new Topic<Vector3>();
        public Topic<float> SpeedLimit { get; } = new Topic<float>(1f);

        public void Update(float time)
        {
            Vector3 velocity = Velocity.Value + time * Acceleration.Value;
            Velocity.Value = LimitSpeed(velocity);
            Position.Value = Position.Value + time * velocity;
        }

        private Vector3 LimitSpeed(Vector3 velocity)
        {
            if (velocity.sqrMagnitude > SpeedLimit.Value * SpeedLimit.Value)
            {
                return velocity.normalized * SpeedLimit.Value;
            }

            return velocity;
        }
    }
}