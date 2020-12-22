import SwiftUI

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(watchOS 6.0, *)
@available(OSX 10.15, *)
public struct IndicatorKun: View {
    @State var isAnimation = false
    
    public init() {
        
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 200, height: 120, alignment: .center)
                .foregroundColor(Color.gray)

            VStack {
                Spacer()
                Circle()
                    .trim(from: 0, to: 0.6)
                    .stroke(AngularGradient(gradient: Gradient(colors: [.gray, .white]), center: .center),
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round,
                                dash: [0.1, 16],
                                dashPhase: 8))

                    .frame(width: 48, height: 48)
                    .rotationEffect(Angle(degrees: self.isAnimation ? 360 : 0))
                    .onAppear() {
                        withAnimation(
                            Animation
                                .linear(duration: 1)
                                .repeatForever(autoreverses: false)) {
                                    self.isAnimation.toggle()
                        }
                }

                Text("読み込み中")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .lineLimit(1)
                    .padding(.top)
                Spacer()
            }
        }
    }
}
