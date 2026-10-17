//
//  AboutView.swift
//  iQsign
//

import SwiftUI
import NimbleViews

// MARK: - View
struct AboutView: View {
	var body: some View {
		NBList(.localized("About")) {
			// Header: شعار واسم iQsign
			Section {
				VStack(spacing: 12) {
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
					.frame(width: 85, height: 85)
					.clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
					.shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
					
					VStack(spacing: 4) {
						Text("iQsign")
							.font(.title2.bold())
						Text("أفضل أداة لتوقيع وإدارة تطبيقات iOS")
							.font(.footnote)
							.foregroundStyle(.secondary)
					}
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 14)
			}
			
			// حساب المطور والشهادات
			Section(footer: Text("يتوفر شهادات سنوية وتفعيل فوري").font(.footnote).foregroundStyle(.secondary)) {
				_contactCell(
					title: "المطور",
					subtitle: "@x_arw",
					iconUrl: "https://i.postimg.cc/Bvhzb8VK/4B052995-278C-4F0C-960C-3DC02AB33E44.jpg",
					destinationUrl: "https://t.me/x_arw"
				)
			}
			
			// القنوات الرسمية
			Section(header: Text("قنوات الدعم والتحديثات")) {
				_contactCell(
					title: "قناة التحديثات الرسمية",
					subtitle: "@xar_ipa",
					iconUrl: "https://i.postimg.cc/JnzPVck1/19D4F009-D841-4C17-878D-953DB50DF81E.png",
					destinationUrl: "https://t.me/xar_ipa"
				)
				
				_contactCell(
					title: "قناة حل المشاكل",
					subtitle: "@xar_ipa1",
					iconUrl: "https://i.postimg.cc/JnzPVck1/19D4F009-D841-4C17-878D-953DB50DF81E.png",
					destinationUrl: "https://t.me/xar_ipa1"
				)
			}
		}
	}
}

// MARK: - Extension: View Helper
extension AboutView {
	@ViewBuilder
	private func _contactCell(
		title: String,
		subtitle: String,
		iconUrl: String,
		destinationUrl: String
	) -> some View {
		Button {
			if let url = URL(string: destinationUrl) {
				UIApplication.shared.open(url)
			}
		} label: {
			HStack(spacing: 12) {
				AsyncImage(url: URL(string: iconUrl)) { phase in
					switch phase {
					case .success(let image):
						image
							.resizable()
							.scaledToFill()
					default:
						Color.secondary.opacity(0.2)
					}
				}
				.frame(width: 44, height: 44)
				.clipShape(Circle())
				
				VStack(alignment: .leading, spacing: 2) {
					Text(title)
						.font(.body)
						.foregroundStyle(.primary)
					Text(subtitle)
						.font(.footnote)
						.foregroundStyle(.secondary)
				}
				
				Spacer()
				
				Image(systemName: "arrow.up.right")
					.font(.footnote.weight(.semibold))
					.foregroundStyle(.tertiary)
			}
			.contentShape(Rectangle())
		}
		.buttonStyle(.plain)
	}
}
