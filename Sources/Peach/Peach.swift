// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import PeachObjC

public enum NESKey : UInt8 {
    case right = 0b10000000
    case left = 0b01000000
    case down = 0b00100000
    case up = 0b00010000
    case start = 0b00001000
    case select = 0b00000100
    case b = 0b00000010
    case a = 0b00000001
}

public struct Peach : @unchecked Sendable {
    public static let shared = Peach()
    
    var emulator: PeachObjC = .shared()
    
    public func insert(cartridge: URL) { emulator.insert(cartridge: cartridge) }
    public func step() { emulator.step() }
    
    public func framebuffer() -> UnsafeMutablePointer<UInt32> { emulator.framebuffer() }
    
    public func width() -> Int32 { emulator.width() }
    public func height() -> Int32 { emulator.height() }
    
    public func button(button: NESKey, player: Int, pressed: Bool) { emulator.button(button.rawValue, player: .init(player), pressed: pressed) }
}
