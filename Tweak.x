// DeezerSiriFix
// Empêche le crash "Use of the class INVocabulary requires the entitlement
// com.apple.developer.siri" quand Deezer tourne dans LiveContainer.

#import <Foundation/Foundation.h>
#import <Intents/Intents.h>

// Deezer envoie des noms (artistes, playlists...) à Siri : on ignore l'appel.
%hook INVocabulary

- (void)setVocabularyStrings:(id)vocabulary ofType:(NSInteger)type {
    return;
}

- (void)removeAllVocabularyStrings {
    return;
}

%end

// Évite aussi un crash éventuel sur la demande d'autorisation Siri.
%hook INPreferences

+ (void)requestSiriAuthorization:(void (^)(NSInteger status))handler {
    if (handler) {
        handler(INSiriAuthorizationStatusDenied);
    }
}

%end
