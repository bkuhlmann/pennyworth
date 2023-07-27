#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "Pennyworth Architecture"

participant Alfred
participant Pennyworth
participant Ruby
participant RubyGems
participant "Standard Gems"
participant GitHub

group Native Ruby
  Alfred->Pennyworth: User request
  Pennyworth->Ruby: Process action
  Pennyworth<-Ruby: Answer records
  Pennyworth->Pennyworth: Load presenters

  note over Pennyworth
    "Injects record."
  end note

  Pennyworth->Pennyworth: Load serializers

  note over Pennyworth
    "Injects presenter."
  end note

  Alfred<-Pennyworth: Render script filter

  note over Pennyworth
    "Answers JSON response."
  end note
end

group RubyGems API
  Alfred->Pennyworth: User request
  Pennyworth->Pennyworth: Process action
  Pennyworth->RubyGems: API request
  Pennyworth<-RubyGems: API response
  Pennyworth->Pennyworth: Load presenters
  Pennyworth->Pennyworth: Load serializers
  Alfred<-Pennyworth: Render script filter
end

group Standard Gems API
  Alfred->Pennyworth: User request
  Pennyworth->Pennyworth: Process action
  Pennyworth->"Standard Gems": API request
  Pennyworth<-"Standard Gems": API response
  Pennyworth->Pennyworth: Load presenters
  Pennyworth->Pennyworth: Load serializers
  Alfred<-Pennyworth: Render script filter
end

group GitHub API
  Alfred->Pennyworth: User request
  Pennyworth->Pennyworth: Process action
  Pennyworth->GitHub: API request
  Pennyworth<-GitHub: API response
  Pennyworth->Pennyworth: Load presenters
  Pennyworth->Pennyworth: Load serializers
  Alfred<-Pennyworth: Render script filter
end
