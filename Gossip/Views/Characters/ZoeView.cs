using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("ZoeView")]
	public class ZoeView : CharacterView
	{
		public MainViewController mvc { get; set; }

		public ZoeView() : base()
		{
			characterId = 5;

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.zoeHateful;
				uiCharacterImages[1] = Resources.zoeNasty;
				uiCharacterImages[2] = Resources.zoeNotNice;
				uiCharacterImages[3] = Resources.zoeUnpleasant;
				uiCharacterImages[4] = Resources.zoeSoSo;
				uiCharacterImages[5] = Resources.zoePleasant;
				uiCharacterImages[6] = Resources.zoeNice;
				uiCharacterImages[7] = Resources.zoeGreat;
				uiCharacterImages[8] = Resources.zoeAdorable;
				uiCharacterImages[9] = Resources.zoeHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.zoeHateful.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.zoeNasty.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.zoeNotNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.zoeUnpleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.zoeSoSo.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.zoePleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.zoeNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.zoeGreat.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.zoeAdorable.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.zoeHello.Scale(new SizeF(64.0f, 64.0f));
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

