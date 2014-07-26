using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("OwenView")]
	public class OwenView : CharacterView
	{
		public MainViewController mvc { get; set; }

		public OwenView() : base()
		{
			characterId = 1;

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.owenHateful;
				uiCharacterImages[1] = Resources.owenNasty;
				uiCharacterImages[2] = Resources.owenNotNice;
				uiCharacterImages[3] = Resources.owenUnpleasant;
				uiCharacterImages[4] = Resources.owenSoSo;
				uiCharacterImages[5] = Resources.owenPleasant;
				uiCharacterImages[6] = Resources.owenNice;
				uiCharacterImages[7] = Resources.owenGreat;
				uiCharacterImages[8] = Resources.owenAdorable;
				uiCharacterImages[9] = Resources.owenHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.owenHateful.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.owenNasty.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.owenNotNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.owenUnpleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.owenSoSo.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.owenPleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.owenNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.owenGreat.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.owenAdorable.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.owenHello.Scale(new SizeF(64.0f, 64.0f));
			} 
			
			dimensions = new SizeF(uiCharacterImages[0].Size.Width, uiCharacterImages[0].Size.Height);
			location = new PointF(Story.CharacterLocations[characterId, 0], Story.CharacterLocations[characterId, 1]);
			ModifyFrame();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (mvc == null) mvc = ((MainView)this.Superview).mvc;
		}
	}
}

