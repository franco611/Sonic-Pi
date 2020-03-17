use_bpm 80

adn=(ring :i ,:iv,:v,:vi)
prg=(ring 0,1,0,3,2)

bit=0.25

ry=(spread rrand(3, 6), 6)
ry2=(spread rrand(1, 6), 6)

v=(range 0,1, step:bit) + (range 1,0, step:bit)


10.times do
  c=adn[prg[0]]
  puts 0 ,prg[0],c, 0
  
  in_thread do
    j=0
    6.times do
      if ry[j]
        sample :drum_bass_hard, amp:3
      end
      if ry2[j]
        sample :drum_cymbal_pedal, amp:0.5
      end
      j=j+1
      sleep bit
    end
  end
end

use_bpm 80

live_loop :kickdrum do
  sample :bd_haus, amp: 1
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_soft, amp: 0.4
  sleep 0.5
end

live_loop :bass do
  use_synth :fm
  play :c2
  sleep 0.25
  play :c2
  sleep 2
  play :e2
  sleep 0.75
  play :f2
  sleep 1
end
live_loop :snare do
  sleep 1
  sample :drum_snare_soft, amp: 1.3
  sleep 1
end
live_loop :biitti do
  sample :bd_808, rate: 1, amp: 4
  sleep 1
  sample :elec_hi_snare, amp: 1
  sleep 1
  sample :bd_808, rate: 1, amp: 4
  sleep 1
  sample :elec_hi_snare, amp: 1
  sleep 1
end

live_loop :pulputus do
  with_fx :reverb, amp: 1, mix: 0.25 do
    use_synth :tb303
    nuotti = (chord :C2, :minor).choose
    play nuotti, cutoff: rrand(10, 130), release: 0.1, amp: 0.7, release: 0.1
    sleep 0.25
  end
end