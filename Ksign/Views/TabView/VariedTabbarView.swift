//
//  VariedTabbarView.swift
//  iQsign
//

import SwiftUI

struct VariedTabbarView: View {
	init() {}
	
	var body: some View {
		ZStack(alignment: .top) {
			// محتوى شاشات التطبيق الأساسي
			Group {
				if #available(iOS 18, *) {
					ExtendedTabbarView()
				} else {
					TabbarView()
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			
			// النافذة العائمة الثابتة بالأعلى
			_floatingHeaderView()
				.padding(.top, 48) // مسافة ملائمة للنوتش والجزيرة التفاعلية
		}
		.ignoresSafeArea(.keyboard, edges: .bottom)
	}
	
	// MARK: - Floating Header View
	@ViewBuilder
	private func _floatingHeaderView() -> some View {
		HStack(spacing: 10) {
			// الصورة الأولى محلياً
			Image("Kana_love")
				.resizable()
				.scaledToFit()
				.frame(width: 38, height: 38)
				.clipShape(Circle())
			
			// اسم التطبيق والإصدار
			VStack(alignment: .leading, spacing: 2) {
				HStack(spacing: 6) {
					Text("iQsign")
						.font(.system(size: 15, weight: .bold, design: .rounded))
						.foregroundStyle(.primary)
					
					Text("1.00")
						.font(.system(size: 10, weight: .bold))
						.padding(.horizontal, 6)
						.padding(.vertical, 2)
						.background(Color.blue.opacity(0.18))
						.foregroundStyle(.blue)
						.clipShape(Capsule())
				}
				
				Text("Official Edition")
					.font(.system(size: 9, weight: .medium))
					.foregroundStyle(.secondary)
			}
			
			Spacer()
			
			// الصورة الثانية محلياً
			Image("Kana_peek")
				.resizable()
				.scaledToFit()
				.frame(width: 44, height: 36)
		}
		.padding(.horizontal, 14)
		.padding(.vertical, 7)
		.background(.ultraThinMaterial)
		.clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
		.overlay(
			RoundedRectangle(cornerRadius: 18, style: .continuous)
				.stroke(Color.primary.opacity(0.08), lineWidth: 1)
		)
		.shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 3)
		.padding(.horizontal, 16)
	}
}
