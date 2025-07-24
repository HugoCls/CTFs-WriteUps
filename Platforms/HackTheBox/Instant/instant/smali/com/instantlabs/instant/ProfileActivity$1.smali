.class Lcom/instantlabs/instant/ProfileActivity$1;
.super Ljava/lang/Object;
.source "ProfileActivity.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/ProfileActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/ProfileActivity;

.field final synthetic val$balance:Landroid/widget/TextView;

.field final synthetic val$email:Landroid/widget/TextView;

.field final synthetic val$role:Landroid/widget/TextView;

.field final synthetic val$username:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    const-class v0, Lcom/instantlabs/instant/ProfileActivity;

    return-void
.end method

.method constructor <init>(Lcom/instantlabs/instant/ProfileActivity;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$1;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    iput-object p2, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$username:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$email:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$balance:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$role:Landroid/widget/TextView;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 1

    iget-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$1;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    .line 57
    new-instance v0, Lcom/instantlabs/instant/ProfileActivity$1$1;

    invoke-direct {v0, p0, p2}, Lcom/instantlabs/instant/ProfileActivity$1$1;-><init>(Lcom/instantlabs/instant/ProfileActivity$1;Ljava/io/IOException;)V

    invoke-virtual {p1, v0}, Lcom/instantlabs/instant/ProfileActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string p1, "Role: "

    const-string v0, "Balance: "

    const-string v1, "Email: "

    const-string v2, "Username: "

    .line 68
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 70
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p2

    .line 72
    :try_start_0
    invoke-static {p2}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object p2

    const-string v3, "Profile"

    .line 73
    invoke-virtual {p2, v3}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object p2

    const-string/jumbo v3, "username"

    .line 74
    invoke-virtual {p2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "email"

    .line 75
    invoke-virtual {p2, v4}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "wallet_balance"

    .line 76
    invoke-virtual {p2, v5}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "role"

    .line 77
    invoke-virtual {p2, v6}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object p2

    iget-object v6, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$username:Landroid/widget/TextView;

    .line 79
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$email:Landroid/widget/TextView;

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$balance:Landroid/widget/TextView;

    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/instantlabs/instant/ProfileActivity$1;->val$role:Landroid/widget/TextView;

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    iget-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$1;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    .line 84
    new-instance p2, Lcom/instantlabs/instant/ProfileActivity$1$2;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/ProfileActivity$1$2;-><init>(Lcom/instantlabs/instant/ProfileActivity$1;)V

    invoke-virtual {p1, p2}, Lcom/instantlabs/instant/ProfileActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$1;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    const-string p2, "Something Went Wrong!"

    const/4 v0, 0x0

    .line 92
    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method
