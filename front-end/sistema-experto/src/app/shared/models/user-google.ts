import { ProviderDatum } from "./provider-datum";
import { StsTokenManager } from "./sts-token-manager";

export interface UserGoogle {
  uid: string;
    email: string;
    emailVerified: boolean;
    displayName: string;
    isAnonymous: boolean;
    photoURL: string;
    providerData: ProviderDatum[];
    stsTokenManager: StsTokenManager;
    createdAt: string;
    lastLoginAt: string;
    apiKey: string;
    appName: string;
}
