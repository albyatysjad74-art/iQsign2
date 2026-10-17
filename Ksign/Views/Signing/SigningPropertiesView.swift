//
//  SigningAppPropertiesView.swift
//  iQsign
//

import SwiftUI
import NimbleViews

// MARK: - View
struct SigningPropertiesView: View {
	@Environment(\.dismiss) var dismiss
	
	@State private var text: String = ""
	
	var saveButtonDisabled: Bool {
		text == initialValue
	}
	
	var title: String
	var initialValue: String 
	var certAppId: String? = nil
	@Binding var bindingValue: String?
	
	// MARK: Body
	var body: some View {
        NBList(title) {
            Section {
                TextField(initialValue, text: $text)
                    .textInputAutocapitalization(.none)
            }
            
            // قسم التكرار السريع الذكي لتطبيق iQsign
            Section {
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        _applyAutoClone()
                    }
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.12))
                                .frame(width: 32, height: 32)
                            Image(systemName: "plus.square.on.square.fill")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.blue)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("تكرار كنسخة ثانية (Clone 2)")
                                .font(.body.weight(.medium))
                                .foregroundStyle(.primary)
                            Text("إضافة الرقم 2 وتعديل المعرّف تلقائياً")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text("+2")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .padding(.horizontal, 9)
                            .padding(.vertical, 4)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                    .padding(.vertical, 2)
                }
                .buttonStyle(.plain)
            } footer: {
                Text("يتيح لك تثبيت التطبيق إلى جانب النسخة الأساسية دون استبدالها.")
                    .font(.footnote)
            }

            if certAppId != nil {
                Section {
                    Button {
                        text = certAppId ?? ""
                    } label: {
                        Text(.localized("Matching Certificate's App ID"))
                    }
                    .disabled(certAppId == nil)
                } footer: {
                    Text(.localized("Use certiticate's app ID, this will help the app have access to features that uses certificate's entitlements."))
                }
            }
        }
		.toolbar {
			NBToolbarButton(
				.localized("Save"),
				style: .text,
				placement: .topBarTrailing,
				isDisabled: saveButtonDisabled
			) {
				if !saveButtonDisabled {
					bindingValue = text
					dismiss()
				}
			}
		}
		.onAppear {
			text = initialValue
		}
	}
	
	// MARK: - Logic
	private func _applyAutoClone() {
		// إذا كان الحقل هو Bundle Identifier (يحتوي على نقاط كالمعتاد com.example.app)
		if text.contains(".") && !text.contains(" ") {
			if !text.hasSuffix(".2") {
				text += ".2"
			}
		} else {
			// إذا كان الحقل هو اسم التطبيق
			if !text.hasSuffix(" 2") {
				text += " 2"
			}
		}
	}
}
