.class public Lcom/instantlabs/instant/ProfileActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ProfileActivity.java"


# static fields
.field private static final ACCESS_TOKEN_KEY:Ljava/lang/String; = "access_token"

.field private static final SHARED_PREFS_NAME:Ljava/lang/String; = "app_prefs"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private getAccessToken()Ljava/lang/String;
    .locals 3

    const-string v0, "app_prefs"

    const/4 v1, 0x0

    .line 110
    invoke-virtual {p0, v0, v1}, Lcom/instantlabs/instant/ProfileActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "access_token"

    const/4 v2, 0x0

    .line 111
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 35
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    sget p1, Lcom/instantlabs/instant/R$layout;->activity_profile:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->setContentView(I)V

    .line 38
    sget p1, Lcom/instantlabs/instant/R$id;->username_display:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/widget/TextView;

    .line 39
    sget p1, Lcom/instantlabs/instant/R$id;->email_display:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/widget/TextView;

    .line 40
    sget p1, Lcom/instantlabs/instant/R$id;->wallet_bal_display:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/widget/TextView;

    .line 41
    sget p1, Lcom/instantlabs/instant/R$id;->role_display:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Landroid/widget/TextView;

    .line 43
    sget p1, Lcom/instantlabs/instant/R$id;->make_txn_btn:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ProfileActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 46
    invoke-direct {p0}, Lcom/instantlabs/instant/ProfileActivity;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 47
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz v0, :cond_0

    .line 49
    new-instance v1, Lokhttp3/OkHttpClient;

    invoke-direct {v1}, Lokhttp3/OkHttpClient;-><init>()V

    .line 50
    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    const-string v7, "http://mywalletv1.instant.htb/api/v1/view/profile"

    .line 51
    invoke-virtual {v6, v7}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v6

    const-string v7, "Authorization"

    .line 52
    invoke-virtual {v6, v7, v0}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 54
    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v6

    new-instance v7, Lcom/instantlabs/instant/ProfileActivity$1;

    move-object v0, v7

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/instantlabs/instant/ProfileActivity$1;-><init>(Lcom/instantlabs/instant/ProfileActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-interface {v6, v7}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 99
    :cond_0
    new-instance v0, Lcom/instantlabs/instant/ProfileActivity$2;

    invoke-direct {v0, p0}, Lcom/instantlabs/instant/ProfileActivity$2;-><init>(Lcom/instantlabs/instant/ProfileActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
