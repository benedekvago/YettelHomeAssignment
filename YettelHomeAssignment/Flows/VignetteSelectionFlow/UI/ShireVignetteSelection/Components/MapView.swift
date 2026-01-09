//
//  MapView.swift
//  YettelHomeAssignment
//
//  Created by Vágó Benedek on 2026. 01. 09..
//

import SwiftUI

struct MapView: View {
    
    private let selectedVignettes: [Vignette]
    
    init(selectedVignettes: [Vignette]) {
        self.selectedVignettes = selectedVignettes
    }
    
    struct ImageData {
        let image: Image
        let x: CGFloat
        let y: CGFloat
        let width: CGFloat
        let height: CGFloat
        let isSelected: Bool
    }

    var body: some View {
        let images: [ImageData] = [
            ImageData(image: Assets.somogy, x: 33.5, y: 169, width: 63.4, height: 72.8, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .somogy
                default:
                    false
                }
            })),
            ImageData(image: Assets.zala, x: 11, y: 162.5, width: 48.8, height: 49.3, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .zala
                default:
                    false
                }
            })),
            ImageData(image: Assets.szabolcsSzatmarBereg, x: 228.6, y: 73.7, width: 82.4, height: 54.4, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .szabolcsSzatmarBereg
                default:
                    false
                }
            })),
            ImageData(image: Assets.bacsKiskun, x: 120, y: 159.3, width: 66.9, height: 79.8, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .bacsKiskun
                default:
                    false
                }
            })),
            ImageData(image: Assets.komaromEsztergom, x: 82.2, y: 114, width: 49, height: 31.3, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .komaromEsztergom
                default:
                    false
                }
            })),
            ImageData(image: Assets.pest, x: 119.7, y: 98.7, width: 65, height: 73.1, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .pest
                default:
                    false
                }
            })),
            ImageData(image: Assets.vas, x: 0, y: 135.7, width: 55.5, height: 47.2, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .vas
                default:
                    false
                }
            })),
            ImageData(image: Assets.veszprém, x: 44.6, y: 134.5, width: 54.6, height: 58.4, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .veszprém
                default:
                    false
                }
            })),
            ImageData(image: Assets.gyorMosonSopron, x: 16.8, y: 99.3, width: 68.4, height: 49.7, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .gyorMosonSopron
                default:
                    false
                }
            })),
            ImageData(image: Assets.baranya, x: 67.9, y: 205.7, width: 58.4, height: 44.3, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .baranya
                default:
                    false
                }
            })),
            ImageData(image: Assets.tolna, x: 86.3, y: 177.2, width: 47, height: 48.9, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .tolna
                default:
                    false
                }
            })),
            ImageData(image: Assets.fejer, x: 89.5, y: 130, width: 42.5, height: 58.1, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .fejer
                default:
                    false
                }
            })),
            ImageData(image: Assets.csongrád, x: 162.7, y: 180.5, width: 53.2, height: 45.3, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .csongrád
                default:
                    false
                }
            })),
            ImageData(image: Assets.bekes, x: 198.6, y: 152.7, width: 59, height: 64.6, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .bekes
                default:
                    false
                }
            })),
            ImageData(image: Assets.jaszNagykunSzolnok, x: 163.9, y: 123.2, width: 62.7, height: 60.8, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .jaszNagykunSzolnok
                default:
                    false
                }
            })),
            ImageData(image: Assets.heves, x: 160.1, y: 92.7, width: 54.8, height: 47.8, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .heves
                default:
                    false
                }
            })),
            ImageData(image: Assets.nograd, x: 131.1, y: 86.5, width: 52.7, height: 36.8, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .nograd
                default:
                    false
                }
            })),
            ImageData(image: Assets.borsodAbaujZemplen, x: 182, y: 64, width: 93.4, height: 62, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .borsodAbaujZemplen
                default:
                    false
                }
            })),
            ImageData(image: Assets.hajduBihar, x: 217.5, y: 104.9, width: 59.4, height: 66.5, isSelected: selectedVignettes.contains(where: {
                switch $0.type {
                case .shire(let shire):
                    shire == .hajduBihar
                default:
                    false
                }
            })),
            ImageData(image: Assets.budapest, x: 130.6, y: 128, width: 18.6, height: 16.6, isSelected: false),
        ]
        let maxX = images.map { ($0.x+$0.width/2) + $0.width }.max() ?? 0
        let maxY = images.map { ($0.y+$0.height/2) + $0.height }.max() ?? 0
        ZStack {
            ForEach(images.indices, id: \.self) { index in
                let imageData = images[index]
                image(imageData: imageData)
            }
            .padding(.leading, 25)
        }
        .frame(width: maxX, height: maxY) // ZStack now contains all images
    }
    
    func image(imageData: ImageData) -> some View {
        imageData.image
            .renderingMode(.template)
            .resizable()
            .foregroundColor(imageData.isSelected ? Assets.selectedShire : Assets.notSelectedShire)
            .frame(width: imageData.width, height: imageData.height)
            .position(
                x: imageData.x + imageData.width / 2,
                y: imageData.y + imageData.height / 2
            )
    }
}
