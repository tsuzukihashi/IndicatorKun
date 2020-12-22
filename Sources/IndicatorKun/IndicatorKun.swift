import SwiftUI

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(watchOS 6.0, *)
@available(OSX 10.15, *)
public struct IndicatorKun: View {
    @State var isAnimation = false
    let title: String
    let backgroundColor: Color
    let backSize: CGSize
    let circleColors: [Color]
    let circleSize: CGSize
    let font: Font
    
    public init(
        title: String = "読み込み中",
        backgroundColor: Color = .gray,
        backSize: CGSize = .init(width: 200, height: 120),
        circleColors: [Color] = [.gray, .white],
        circleSize: CGSize = .init(width: 48, height: 48),
        font: Font = .system(size: 12, weight: .medium, design: .rounded)
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.backSize = backSize
        self.circleColors = circleColors
        self.circleSize = circleSize
        self.font = font
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: backSize.width, height: backSize.height, alignment: .center)
                .foregroundColor(backgroundColor)
            
            VStack {
                Spacer()
                Circle()
                    .trim(from: 0, to: 0.6)
                    .stroke(
                        AngularGradient(gradient: Gradient(colors: circleColors), center: .center),
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round,
                            dash: [0.1, 16],
                            dashPhase: 8
                        )
                    )
                    .frame(width: circleSize.width, height: circleSize.height)
                    .rotationEffect(Angle(degrees: self.isAnimation ? 360 : 0))
                    .onAppear() {
                        withAnimation(
                            Animation
                                .linear(duration: 1)
                                .repeatForever(autoreverses: false)) {
                            self.isAnimation.toggle()
                        }
                    }
                
                Text(title)
                    .foregroundColor(.white)
                    .font(font)
                    .lineLimit(1)
                    .padding(.top)
                Spacer()
            }
        }
    }
}
