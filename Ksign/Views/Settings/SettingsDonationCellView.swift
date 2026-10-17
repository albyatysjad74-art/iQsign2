//
//  SettingsDonationCellView.swift
//  iQsign
//

import SwiftUI
import NimbleViews

struct SettingsDonationCellView: View {
	var site: String = "https://t.me/x_arw"
	
	var body: some View {
		Section {
			VStack(spacing: 14) {
				_title()
				
				_benefit(
					"شهادات سنوية مضمونة",
					"تفعيل فوري مع ضمان استمرار التطبيقات بدون توقف، تواصل معنا للاشتراك.",
					systemName: "checkmark.seal.fill"
				)
				
				Button {
					if let url = URL(string: "https://t.me/x_arw") {
						UIApplication.shared.open(url)
					}
				} label: {
					_sheetButton("طلب اشتراك فوري")
				}
				.frame(height: 45)
			}
			.padding(.vertical, 12)
			.buttonStyle(.plain)
		}
	}
	
	@ViewBuilder
	private func _title() -> some View {
		VStack(alignment: .center, spacing: 12) {
			AsyncImage(url: URL(string: "https://i.postimg.cc/K8dLKwjS/6788CEFF-040E-4A1F-841F-7291FB480CC9.jpg")) { phase in
				switch phase {
				case .success(let image):
					image
						.resizable()
						.scaledToFill()
				default:
					ProgressView()
				}
			}
			.frame(width: 65, height: 65)
			.clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
			.shadow(color: .black.opacity(0.12), radius: 5, x: 0, y: 2)
			
			Text("iQsign VIP")
				.font(.title2)
				.bold()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
	}
	
	@ViewBuilder
	private func _benefit(
		_ title: String,
		_ desc: String,
		systemName: String
	) -> some View {
		HStack(alignment: .center, spacing: 14) {
			Image(systemName: systemName)
				.font(.system(size: 30))
				.foregroundStyle(.tint)
				.frame(width: 38, alignment: .center)
			
			NBTitleWithSubtitleView(
				title: title,
				subtitle: desc
			)
		}
	}
	
	@ViewBuilder
	private func _sheetButton(_ title: String) -> some View {
		Text(title)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(Color.accentColor)
			.foregroundColor(.white)
			.clipShape(
				RoundedRectangle(cornerRadius: 12, style: .continuous)
			)
			.bold()
	}
}