using UnityEngine;
using UnityEngine.UI;

namespace ScaryJam.UI
{
    
    public class UIImaginaryClickable : MaskableGraphic
    {
        public override bool Raycast(Vector2 sp, Camera eventCamera)
        {
            // This just checks if the raycast hits the rect but you can add any custom shape or criteria here.
            return base.Raycast(sp, eventCamera);
        }
 
        protected override void OnPopulateMesh(VertexHelper vh)
        {
            vh.Clear();
        }
    }
}